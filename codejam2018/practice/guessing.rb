gets.to_i.times {
    l, h = gets.split.map(&:to_i)
    g = gets.to_i
    ans = ''
    while ans != 'CORRECT' do
        g -= 1
        cur = (l + h + 1) / 2
        puts cur
        STDOUT.flush
        ans = gets.strip
        if ans == 'TOO_BIG' then
            h = cur-1
        end
        if ans == 'TOO_SMALL' then
            l = cur
        end
        break if g == 0
    end
}
