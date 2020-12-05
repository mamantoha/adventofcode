passes = File.read_lines("input")

rows_range = (0..127).to_a
columns_range = (0..7).to_a

seat_ids = [] of Int32

passes.each do |pass|
  seat = {"row" => 0, "column" => 0}
  pass.chars.each_slice(7).with_index do |chars, i|
    type = i == 0 ? "row" : "column"

    row = rows_range
    column = columns_range

    if type == "row"
      chars.each do |ch|
        case ch
        when 'F'
          row = row.each_slice(row.size // 2).to_a[0]
        when 'B'
          row = row.each_slice(row.size // 2).to_a[1]
        end
      end

      seat[type] = row.first
    elsif type == "column"
      chars.each do |ch|
        case ch
        when 'L'
          column = column.each_slice(column.size // 2).to_a[0]
        when 'R'
          column = column.each_slice(column.size // 2).to_a[1]
        end
      end
      seat[type] = column.first
    end
  end

  seat_ids << seat["row"] * 8 + seat["column"]
end

puts (seat_ids.min..seat_ids.max).to_a - seat_ids # => [727]
