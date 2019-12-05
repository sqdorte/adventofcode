def f(m)
  if m <= 6
    return 0
  else
    fuel = (m/3).round - 2
    return fuel + f(fuel)
  end
end

i = $stdin.read.split("\n").map { |str| str.to_i }
p i.reduce(0) { |sum, n| sum + f(n) }
