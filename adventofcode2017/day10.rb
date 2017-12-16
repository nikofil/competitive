def revs(ar, from, cnt)
    if from+cnt <= ar.length then
        ar[0...from] + ar[from...from+cnt].reverse + ar[from+cnt..-1]
    else
        arrev = ar[from..-1] + ar[0...(from+cnt) % ar.length]
        arrev.reverse!
        arrev[ar.length - from..-1] + ar[(from+cnt)%ar.length...from] + arrev[0...ar.length - from]
    end
end

lst = (0...256).to_a
skip = 0
pos = 0
gets.split(',').map(&:to_i).each{|x|
    lst = revs(lst, pos, x)
    pos = (pos + x + skip) % lst.length
    skip += 1
}
puts lst[0]*lst[1]
