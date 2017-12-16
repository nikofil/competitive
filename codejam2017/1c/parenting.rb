gets.to_i.times{|cur|
    c, j = gets.split.map(&:to_i)
    c = (1..c).map{
        gets.split.map(&:to_i)
    }.sort{|x,y|
        x[0] <=> y[0]
    }
    j = (1..j).map{
        gets.split.map(&:to_i)
    }.sort{|x,y|
        x[0] <=> y[0]
    }

    a = [c.map{|x| x[0]}, j.map{|x| x[0]}]
    ind = 0
    curt = 0
    exch = 1

    while true do
        curt = a[ind].select{|x| x >= curt}[0]
        if curt == nil then
            break
        end
        ind = 1-ind
        exch += 1
    end

    max = exch
    ind = 1
    curt = 0
    exch = 1

    while true do
        curt = a[ind].select{|x| x >= curt}[0]
        if curt == nil then
            break
        end
        ind = 1-ind
        exch += 1
    end
    if exch < max then
        max = exch
    end

    puts "Case ##{cur+1}: #{max}"
}
