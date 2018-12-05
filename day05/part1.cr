input = File.read("input").chomp

struct Char
  def swapcase
    if uppercase?
      downcase
    elsif lowercase?
      upcase
    end
  end
end

chars = input.chars
new_str = [] of Char

chars.each do |char|
  new_str << char
  new_str.pop(2) if new_str[-2]? && new_str[-2].swapcase == char
end

puts new_str.size
