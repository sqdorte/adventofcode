f = lambda { |m| (m/3).round - 2 }

i = $stdin.read.split("\n").map { |str| str.to_i }
p i.reduce(0) { |sum, n| sum + f[n] }
