struct Range(B, E)
  def overlaps?(other : Range) : Bool
    covers?(other.begin) || other.covers?(@begin)
  end

  def includes?(other : Range) : Bool
    begin_value = @begin
    end_value = @end

    other_begin_value = other.begin
    other_end_value = other.end

    (@exclusive == other.@exclusive) &&
      # begin passes
      (begin_value.nil? || (!other_begin_value.nil? && other_begin_value >= begin_value)) &&
      # end passes
      (end_value.nil? ||
        (@exclusive ? !other_end_value.nil? && other_end_value < end_value : !other_end_value.nil? && other_end_value <= end_value))
  end
end

file_path = "input.txt"

lines =
  File
    .read_lines(file_path)
    .map(&.split(',').map(&.split('-').map(&.to_i)).map { |p| p[0]..p[1] })

puts "Part 1:"
puts lines.count { |p| p[0].covers?(p[1]) || p[1].covers?(p[0]) }
# 456

puts "Part 2:"
puts lines.count { |p| p[0].overlaps?(p[1]) }
# 808
