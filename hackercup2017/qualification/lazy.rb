gets.to_i.times{|x|
    v = ((1..gets.to_i).map {gets.to_i}).sort
    i = 0
    while not v.empty? and v.length * v.last > 50 do
        i += 1
        v.shift((50.0 / v.pop).ceil - 1)
    end
    puts "Case \##{x+1}: #{i}"
}
