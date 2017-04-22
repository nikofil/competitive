gets.to_i.times{|curt|
  n,r,o,y,g,b,v = gets.split.map(&:to_i)
  origin = [r,o,y,g,b,v]
  s = ''
  found = false
  if o > 0 and not found then
    if [r,y,g,v].max == 0 then
      found = true
      if o == b then
        s = 'OB' * o
      elsif b == 0 and o == 1 then
        s = 'O'
      else
        s = 'IMPOSSIBLE'
      end
    else
      if o < b then
        b -= o
      else
        found = true
        s = 'IMPOSSIBLE'
      end
    end
  end
  if g > 0 and not found then
    if [o,y,b,v].max == 0 then
      found = true
      if g == r then
        s = 'GR' * g
      elsif r == 0 and g == 1 then
        s = 'G'
      else
        s = 'IMPOSSIBLE'
      end
    else
      if g < r then
        r -= g
      else
        found = true
        s = 'IMPOSSIBLE'
      end
    end
  end
  if v > 0 and not found then
    if [r,o,g,b].max == 0 then
      found = true
      if v == y then
        s = 'VY' * v
      elsif y == 0 and v == 1 then
        s = 'V'
      else
        s = 'IMPOSSIBLE'
      end
    else
      if v < y then
        y -= v
      else
        found = true
        s = 'IMPOSSIBLE'
      end
    end
  end
  # o - b
  # g - r
  # v - y
  if not found then
    while r > 0 and y > 0 do
      s += 'RY'
      r -= 1
      y -= 1
    end
    if r > 0 then
      while r > 0 and b > 0 do
        s += 'RB'
        r -= 1
        b -= 1
      end
    else
      while y > 0 and b > 0 do
        s += 'BY'
        y -= 1
        b -= 1
      end
    end
    chr = ''
    cnt = 0
    if r > 0 then
      chr = 'R'
      cnt = r
    elsif y > 0 then
      chr = 'Y'
      cnt = y
    elsif b > 0 then
      chr = 'B'
      cnt = b
    end
    if chr != '' then
      s = s.chars.map.with_index{|x, i|
        if x != chr and s[(i+1) % s.length] != chr and cnt > 0 then
          cnt -= 1
          x+chr
        else
          x
        end
      }.join
    end
    if o > 0 then
      s.sub!('B', 'B' + ('OB' * o))
    end
    if g > 0 then
      s.sub!('R', 'R' + ('GR' * g))
    end
    if v > 0 then
      s.sub!('Y', 'Y' + ('VY' * v))
    end
    if cnt > 0 then
      s = 'IMPOSSIBLE'
    end
  end
  if s != 'IMPOSSIBLE' then
    bad = ['RR', 'RV', 'VR', 'RO', 'OR', 'BB', 'BG', 'GB', 'BV', 'VB', 'YY', 'YG', 'GY', 'YO', 'OY']
    bad.each{|b|
      if (s+s).include? b then
        puts 'ERROR found' + b
      end
    }
    chrs = 'ROYGBV'.chars
    chrs.each.with_index{|x, i|
      if s.count(x) != origin[i] then
        puts 'ERROR wrong count of ' + x
      end
    }
  end
  puts "Case \##{curt+1}: #{s}"
}
