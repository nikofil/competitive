gets.to_i.times{|cc|
    st, pl = gets.split.map(&:to_i)
    while st > 100 and pl > 10 do
        if pl & 1 == 1 then
            # go left from center
            st = (st+1)/2
        else
            # go right from center
            st = (st+2)/2
        end
        pl = (pl-1)/2
    end
    a = [true] + [false]*st + [true]
    lastl = 0
    lastp = 0
    pl.times{
        bads = a.map.with_index.select{|i,j| i}.map(&:last) # occupado
        b2 = bads[1...bads.length].zip(bads[0...bads.length-1]).map{|x| [x[0] - x[1], -x[1]]}.sort.map{|x| [x[0], -x[1]]}.reverse # inverse sort by nearby occupied and then by index
        lastl = b2[0][0]
        lastp = b2[0][1] + lastl/2
        a[lastp] = true
    }
    lastl -= 2
    puts "Case #%d: %d %d" % [cc+1, (lastl+1)/2, lastl/2]
}
