inps = STDIN.read.split("\n\n")

state = inps[0].split("\n")[0].scan(/(\w*)[.:]/)[0][0]
steps = inps[0].split("\n")[1].scan(/(\w*) steps/)[0][0].to_i

rules = inps[1..-1].map{|x|
    x.split("\n").map{|y|
        y.scan(/(\w*)[.:]/)[0][0]
    }
}.map{|x|
    [x[0], [x[2..4], x[6..8]]]
}.to_h

tape = [0]*10000000
cur = 0

steps.times{
    ins = if tape[cur] == 0 then rules[state][0] else rules[state][1] end
    tape[cur] = ins[0].to_i
    cur += if ins[1] == 'right' then 1 else -1 end
    state = ins[2]
}

puts "#{tape.count(1)}"
