input = File.read("input").chomp.chars

struct Char
  def swapcase
    if uppercase?
      downcase
    elsif lowercase?
      upcase
    end
  end
end

def react(polymer : Array(Char)) : Array(Char)
  new_polymer = [] of Char

  polymer.each do |unit|
    new_polymer << unit
    new_polymer.pop(2) if new_polymer[-2]? && new_polymer[-2].swapcase == unit
  end

  new_polymer
end

puts ('a'..'z').map { |unit|
  polymer = input.reject { |c| c == unit || c == unit.upcase }
  react(polymer).size
}.min
