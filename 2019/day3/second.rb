vectors = { "R"=> [1,0] , "L"=> [-1, 0], "U"=> [0, 1], "D"=> [0, -1] }

input = $stdin.read().split("\n").map {
  |line| line.split(',').map {
    |str| [vectors[str[0]], str[1..-1].to_i]
  }
}

points = []

input.each do |path|
  points << [[0,0,0]]
  path.each do |step|
    last = points[-1][-1]
    pos = last[0..1]
    count = last[2]

    dir = step[0]
    dist = step[1]

    points[-1] += (1..dist).map { |n| [ pos[0] + dir[0] * n, pos[1] + dir[1] * n, count + n ] }
  end
end

i = points[0].map { |x| x[0..1] } & points[1].map { |x| x[0..1] } - [[0,0]]
s = points.map { |p| Hash[p.select { |x| i.include? x[0..1] }.map { |x| [ x[0..1], x[2]] }] }
p s[0].keys.map { |x| s[0][x] + s[1][x] }.min
