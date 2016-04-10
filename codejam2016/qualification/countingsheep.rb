require 'set'

n = gets.to_i
n.times {|nn|
    k = gets.to_i
    if k == 0 then
        res = "INSOMNIA"
    else
        ss = Set.new []
        i = 0
        while ss.size < 10 do
            i += k
            ss.merge i.to_s.chars
        end
        res = i.to_s
    end
    puts ("Case #" + (nn+1).to_s + ": " + res)
}
