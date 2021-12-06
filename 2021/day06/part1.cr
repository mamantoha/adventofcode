array = File.read("input").chomp.split(',').map(&.to_i)

days = 80

days.times do |day|
  new = 0

  array.map! do |e|
    if e.zero?
      new += 1
      e = 6
    else
      e -= 1
    end
  end

  new.times { array << 8}
end

p array.size # => 393019
