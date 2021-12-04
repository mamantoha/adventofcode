lines = File.read("input").split("\n\n")

numbers = lines[0].split(",").map(&.to_i)

boards = lines[1..]
boards = boards.map(&.lines.map(&.split.map(&.to_i)))

grid_size = i = 5

while boards.any?
  drawn_numbers = numbers[...i]

  boards.each do |board|
    next unless board.any? { |row| (row & drawn_numbers).size == grid_size } ||
                board.transpose.any? { |col| (col & drawn_numbers).size == grid_size }

    if boards.one?
      last_number = drawn_numbers.last
      sum_of_all_unmarked_numbers = (board.flatten - drawn_numbers).sum

      puts last_number * sum_of_all_unmarked_numbers
    end

    boards.delete(board)
  end

  i += 1
end

# 5434
