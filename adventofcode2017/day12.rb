require 'set'

h = {}

while l = gets
    a,b = l.split('<->')
    h[a.strip.to_i] = b.split(',').map(&:strip).map(&:to_i)
end

s = []
vis = Set.new
grps = 0
while vis.length < h.keys.length do
    grps+=1
    s.push (h.keys - vis.to_a)[0]

    while a = s.pop
        unless vis.include? a then
            vis << a
            s.push *h[a]
        end
    end
end

puts grps
