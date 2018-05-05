require 'set'

gets.to_i.times{|cc|
    n,l = gets.split.map(&:to_i)
    w = (1..n).map{gets.strip}
    res = w[0].clone
    (0...l-1).each{|ind|
        m = {}
        w1 = Set.new(w.map{|ww| ww[ind]}).to_a
        w2 = Set.new(w.map{|ww| ww[ind+1]}).to_a
        w1.product(w2).map{|x| x.join}.each{|ww|
            m[ww] = false
        }
        w.each{|ww|
            m[ww[ind..ind+1]] = true
        }
        dob=false
        m.each_pair{|k,v|
            if not v then
                res[ind]=k[0]
                res[ind+1]=k[1]
                dob=true
                break
            end
        }
        break if dob
    }
    res = '-' if res == w[0]
    puts "Case ##{cc+1}: #{res}"
}
