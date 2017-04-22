gets.to_i.times{|curt|
  dest, horses = gets.split.map(&:to_i)
  slow = 0.0
  horses.times{
    pos, sp = gets.split.map(&:to_i)
    slow = [slow, (dest-pos)*1.0 / sp].max
  }
  s = (dest/slow).round(6)
  puts "Case \##{curt+1}: #{s}"
}
