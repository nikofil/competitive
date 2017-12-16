gets.to_i.times{|cur|
    n, k = gets.split.map(&:to_i)
    a = Array.new(n).map{
        gets.split.map(&:to_i)
    }
    max = 0.0
    a.each.with_index{|aa, i|
        b = Array.new(a)
        b.delete_at(i)
        b = b.select{|x|
            x[0] <= aa[0]
        }
        if b.length >= k-1 then
            good = 2 * Math::PI * aa[0] * aa[1] + Math::PI * aa[0] * aa[0]
            b = b.sort{|x,y|
                y[0]*y[1] <=> x[0]*x[1]
            }
            good += (b[0...k-1].map{|x|
                x[0]*x[1]
            }.reduce(:+) or 0) * 2 * Math::PI
            if good > max then
                max = good
            end
        end
    }
    puts "Case ##{cur+1}: #{max}"
}
