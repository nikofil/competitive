d = Array.new(21)
[4, 6, 8, 10, 12, 20].each{|dice|
    d[dice] = Array.new(21) {Array.new(401, 0.0)}
    d[dice][0][0] = 1.0
    (1..20).each{|thr|
        (1..400).each{|val|
            (1..dice).each{|x|
                d[dice][thr][val] += d[dice][thr-1][val-x] / dice unless val < x
            }
        }
    }
}

gets.to_i.times{|t|
    best = 1
    hp = gets.split.first.to_i
    dice = gets.split.map {|x|
        x.scan(/(\d*)d(\d*)([+-]\d*)?/)[0].map(&:to_i)
    }
    probs = dice.map{|t,dc,a|
        (d[dc][t][[(hp-a), 0].max..-1] or [0]).reduce(:+)
    }
    best = sprintf("%.6f", probs.max.round(6))
    puts "Case \##{t+1}: #{best}"
}
