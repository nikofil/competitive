m = STDIN.read.split("\n").map{|x| x+' '} + ['']

y = 0
x = m[0].index '|'
dx = 0
dy = 1

loop do
    case m[y][x]
    when '+'
        if !([' ','|'].include? m[y][x-1])  and dx != 1
            dx=-1
            dy=0
        elsif !([' ','|'].include? m[y][x+1])  and dx != -1
            dx=1
            dy=0
        elsif !([' ','-'].include? m[y-1][x])  and dy != 1
            dx=0
            dy=-1
        elsif !([' ','-'].include? m[y+1][x])  and dy != -1
            dx=0
            dy=1
        else
            puts 'wtf'
        end
        #puts "d: #{dx} #{dy}"
    when '-'
    when '|'
    else
        break if m[y][x] == ' '
        print m[y][x]
    end
    x += dx
    y += dy
    #puts "#{x} #{y}"
end

#puts x,y
