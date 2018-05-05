gets.to_i.times{
    n = gets.to_i
    x = [true]*n
    pr = [0]*n
    n.times{|c|
        i = gets.split.map(&:to_i)[1..-1]
        i.each{|x| pr[x]+=1}
        best = -1
        i.each{|y|
            if x[y] and (best == -1 or pr[y] < pr[best]) then
                best = y
            end
        }
        if best != -1 then
            x[best] = false
            puts best
        else
            puts -1
        end
        #if c*80 < n then
            #puts -1
        #else
        #end
        STDOUT.flush
    }
}
