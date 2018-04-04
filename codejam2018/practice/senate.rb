gets.to_i.times {|cc|
    gets
    a = gets.split.map(&:to_i).map.with_index {|x,i| [x, ('A'.ord + i).chr]}
    out = []
    a.sort_by!{|x| -x[0]}
    while a[0][0] > a[1][0] do
        a[0][0] -= 1
        out << a[0][1]
    end
    for i in a[(2...a.length)] do
        i[0].times { out << i[1] }
    end
    a[0][0].times {
        out << a[0][1] + a[1][1]
    }
    puts "Case #%d: " % [cc+1] + (out.join ' ')
    STDOUT.flush
}
