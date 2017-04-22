gets.to_i.times{|curt|
  n, q = gets.split.map(&:to_i)
  a = []
  n.times{
    a.push(gets.split.map(&:to_i))
  }
  n.times{|i|
    abc = gets
    abc = abc.split.map(&:to_i)
    abc.delete(-1)
    x = abc[0]
    a[i].push(x) if x
  }
  gets
  times = Array.new(n){99999999999999999999.9}
  times[0] = 0.0
  # max,speed,distance
  
  (0...n).each{|city|
    curhorse = a[city]
    kms = 0
    idx = 0
    while kms <= curhorse[0] and a[city+idx+1] do
      kms += a[city+idx][2]
      # puts kms, curhorse
      if kms <= curhorse[0] then
        tt = times[city] + (kms*1.0 / curhorse[1])
        if tt < times[city+idx+1] then
          times[city+idx+1] = tt
        end
      end
      idx += 1
    end
  }
  # puts times
  s = times[-1]
  puts "Case \##{curt+1}: #{s}"
}
