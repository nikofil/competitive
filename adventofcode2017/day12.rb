require 'set'

h = {}

while l = gets
    a,b = l.split('<->')
    h[a.strip.to_i] = b.split(',').map(&:strip).map(&:to_i)
end

s = [0]
vis = Set.new

while a = s.pop
    unless vis.include? a then
        vis << a
        s.push *h[a]
    end
end

puts vis.length
