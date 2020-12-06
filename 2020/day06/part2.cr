groups = File.read_lines("input").slice_when(&.empty?).map(&.reject!(&.empty?).map(&.chars))

sum = 0

groups.each do |group|
  sum += ('a'..'z').count { |char| group.all?(&.includes?(char)) }
end

puts sum # => 3288
