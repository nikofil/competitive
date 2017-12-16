def revs(ar, from, cnt)
    if from+cnt <= ar.length then
        ar[0...from] + ar[from...from+cnt].reverse + ar[from+cnt..-1]
    else
        arrev = ar[from..-1] + ar[0...(from+cnt) % ar.length]
        arrev.reverse!
        arrev[ar.length - from..-1] + ar[(from+cnt)%ar.length...from] + arrev[0...ar.length - from]
    end
end

def knot(inp)
    lst = (0...256).to_a
    skip = 0
    pos = 0
    inp = inp.chars.map(&:ord) + [17, 31, 73, 47, 23]
    64.times {
        inp.each{|x|
            lst = revs(lst, pos, x)
            pos = (pos + x + skip) % lst.length
            skip += 1
        }
    }
    (0...16).map {|x|
        lst[x*16...(x+1)*16].reduce(&:^).to_s(16).rjust(2,'0')
    }.join
end

$h = Hash.new{|x,y| x[y] = []}

inp=gets.strip
prev = []
mat = (0..127).map{|c|
    knot("#{inp}-#{c}").to_i(16).to_s(2).rjust 128, '0'
}

def ad(x1,y1,x2,y2)
    $h[x1*100000+y1] << x2*100000+y2
    $h[x2*100000+y2] << x1*100000+y1
end

(0..127).each{|x|
    (0..127).each{|y|
        next if mat[x][y] != '1'
        ad(x,y,x,y)
        ad(x-1, y, x, y) if x>0 and mat[x-1][y] == '1'
        ad(x, y-1, x, y) if y>0 and mat[x][y-1] == '1'
        ad(x+1, y, x, y) if mat[x+1] and mat[x+1][y] == '1'
        ad(x, y+1, x, y) if mat[x][y+1] == '1'
    }
}

$h.each{|x,y|
    puts "#{x} <-> #{y.uniq.join ','}"
}
