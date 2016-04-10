require 'set'

n = gets.to_i
n.times {|nn|
    s = gets.chomp.chars.map{|x| if x == '+' then 1 else 0 end}
    res = 0
    while s.index 0 do
        res += 1
        s = s[0...-1] while s[-1] == 1
        if s[0] == 1 then
            i = 0
            res += 1
            while s[i] == 1
                s[i] = 0
                i += 1
            end
        end
        s.reverse!
        s.map!{|x| 1-x}
    end
    puts ("Case #" + (nn+1).to_s + ": " + res.to_s)
}
