require 'set'
gets.to_i.times{
    a = gets.to_i
    x, y = [10, 10]
    while a > 0 do
        s = Set.new()
        while s.length < 9 do
            puts "%d %d" % [x,y]
            STDOUT.flush
            s << gets
        end
        a -= 9
        x += 3
    end
}
