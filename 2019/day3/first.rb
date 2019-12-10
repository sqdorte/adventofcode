vectors = { "R"=> [1,0] , "L"=> [-1, 0], "U"=> [0, 1], "D"=> [0, -1] }

input = $stdin.read().split("\n").map {
  |line| line.split(',').map {
    |str| [vectors[str[0]], str[1..-1].to_i]
  }
}

points = []

input.each do |path|
  points << [[0,0]]
  path.each do |step|
    pos = points[-1][-1]
    dir = step[0]
    dist = step[1]

    points[-1] += (1..dist).map { |n| [ pos[0] + dir[0] * n, pos[1] + dir[1] * n ] }
  end
end

p (points[0] & points[1] - [[0,0]]).map{ |x| x[0].abs + x[1].abs }.min
