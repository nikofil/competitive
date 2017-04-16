n = gets.to_i
(1..n).each{|n|
  vis = []
  aa, bb = gets.split.map(&:to_i)
  inp = (1..aa).map{gets.strip}
  inp.each_with_index{|x, line|
    x.chars.each_with_index{|y, cind|
    if y != '?' and not vis.include? y then
	vis << y
        i = cind-1
        while i >= 0 and (x[i] == '?' or x[i] == y) do
          x[i] = y
          i -= 1
        end
        from = i+1
        i = cind+1
        while x[i] == '?' or x[i] == y do
          x[i] = y
          i += 1
        end
        to = i
        allqs = '?' * (to-from)
        up = line-1
        while up >= 0 do
          if inp[up][from... to] != allqs then
            break
          end
          (from...to).each{|i|
            inp[up][i] = y
          }
          up -= 1
        end
        up = line+1
        while inp[up] do
          if inp[up][from... to] != allqs then
            break
          end
          (from...to).each{|i|
            inp[up][i] = y
          }
          up += 1
        end
      end
    }
  }
  puts("Case #%d:" % [n])
  puts(inp.join("\n"))
}
