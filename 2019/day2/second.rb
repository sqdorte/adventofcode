input = $stdin.read.split(",").map { |str| str.to_i }
l = input.length()

(0..99).each do |noun|
  (0..99).each do |verb|
    s = input.dup

    s[1] = noun
    s[2] = verb

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

    if s[0] == 19690720
      p 100 * noun + verb
      exit
    end
  end
end
