gets.to_i.times {|cc|
    gets
    out = gets.strip.chars.map{|x| if x == 'E' then 'S' else 'E' end}.join
    puts "Case ##{cc+1}: #{out}"
}
