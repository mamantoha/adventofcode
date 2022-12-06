input = File.read("input.txt").chomp

def detect_start(chars : Array(Char), count : Int32) : Tuple(Array(Char), Int32) | Nil
  chars.each_cons(count).with_index(count).find do |chunk, i|
    chunk.uniq == chunk
  end
end

print "Part 1: "
puts detect_start(input.chars, 4).try(&.[1])
# 1929

print "Part 2: "
puts detect_start(input.chars, 14).try(&.[1])
# 3298
