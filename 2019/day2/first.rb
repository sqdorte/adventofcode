input = $stdin.read.split(",").map { |str| str.to_i }
s = input

s[1] = 12
s[2] = 2

i = 0
c = s[i]

while c != 99 do
  case c
  when 1
    s[s[i+3]] = s[s[i+1]] + s[s[i+2]]
  when 2
    s[s[i+3]] = s[s[i+1]] * s[s[i+2]]
  end

  i += 4
  c = s[i]
end

p s[0]
