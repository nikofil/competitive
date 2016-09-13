$spaces = 0 

class Keyval
    def initialize(k, v)
        @k = k
        @v = v
    end
    def to_s()
        return ' '*$spaces + '%s=%s' % [@k, @v]
    end
end

class Block
    def initialize()
        @el = []
    end
    def add(x)
        @el.push x
        x
    end
    def to_s()
        s = "\n" + ' '*$spaces + "(\n"
        $spaces += 4
        ss = []
        @el.each {|x|
            if x.kind_of? String then
                ss.push ' '*$spaces + x
            else
                ss.push x.to_s
            end
        }
        $spaces -= 4
        s += ss.join ";\n"
        s += "\n" + ' '*$spaces + ")"
        s
    end
end

s = (1..gets.to_i).map{gets.strip}.join
s = s.chars.delete_if{|x| x.ord == 8203}.join ''
#puts 'input', s

def parse(s)
    s.strip!
    #puts 'hi %s' % s
    m = s.match /^(true|false|null|[0-9]+)/
    if m then
        s.sub! m[0], ''
        s.strip!
        #puts 'const %s' % m[0]
        return [m[0], s]
    end
    if s[0] == "'" then
        ss = "'"
        s = s[1..-1]
        ss += s[0..(s.index "'")]
        s.sub!(/.*?'/, '')
        s.strip!
        return [ss, s] if s[0] != '='
        s = s[1..-1]
        return [ss, ''] if not s
        s.strip!
        tmp, s = parse(s)
        k = Keyval.new(ss, tmp)
        #puts 'keyv %s' % k
        return [k, s]
    end
    r = Block.new
    s = s[1..-1]
    s.strip!
    while s[0] != ')' do
        #puts 'blk parsing "%s" "%s" "%s"' % [s, s.chars[0].ord, s[0] == ')']
        tmp, s = parse s
        r.add(tmp)
        s.strip!
        if s[0] == ';' then
            s = s[1..-1].strip
        end
    end
    #puts 'blk %s' % r
    [r, s[1..-1]]
end

a = parse s
#puts ''
puts a[0].to_s.lines.delete_if{|x| x.strip.empty?}.join 
