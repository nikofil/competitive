require 'prime'

n = gets.to_i
len, count = gets.split.map(&:to_i)
found = []

n.times {|nn|
    puts ("Case #" + (nn+1).to_s + ":")
    st = ("1" + "0"*(len-2) + "1").to_i 2
    en = ("1"*len).to_i 2
    r = (st..en)
    until count == 0 do
        x = rand(r)
        next if x & 1 == 0 or found.include? x
        y = x.to_s(2)
        unless (2..10).any?{|b| Prime.prime?(y.to_i b) } then
            found << x
            STDERR.puts y
            STDERR.print found.uniq.length
            puts y + ' ' + (2..10).map{ |x|
                v = y.to_i x
                Prime.each { |p|
                    break p if v%p == 0
                }
            }.join(' ')
            STDOUT.flush
            count -= 1
            break if count == 0
        end
    end
}
