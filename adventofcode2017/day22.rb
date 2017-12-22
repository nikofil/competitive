m = STDIN.read.split("\n")

x = m[0].length/2
y = m.length/2

10000.times{
    m += ['.' * m[0].length]
}
m.map!{|x| x+'.'*10000}

d = 0
dirs = [[0, -1], [1, 0], [0, 1], [-1, 0]]

cnt = 0

10000000.times{
    #puts m.join "\n"
    case m[y][x]
    when '.'
        d = (d-1)%4
        m[y][x] = 'W'
    when '#'
        d = (d+1)%4
        m[y][x] = 'F'
    when 'W'
        m[y][x] = '#'
        cnt+=1
    when 'F'
        d = (d+2)%4
        m[y][x] = '.'
    end
    x += dirs[d][0]
    y += dirs[d][1]
}

puts cnt
