grid_size = 300

def make_grid(serial_number, grid_size = 300)
  grid = Array.new(grid_size) { Array.new(grid_size, 0) }

  grid_size.times do |y_pos|
    grid_size.times do |x_pos|
      x = x_pos + 1
      y = y_pos + 1

      rack_id = x + 10
      power_level = rack_id * y
      power_level = power_level + serial_number
      power_level = power_level * rack_id
      power_level = power_level / 100
      power_level = power_level % 10
      power_level = power_level - 5

      grid[x_pos][y_pos] = power_level
    end
  end

  grid
end

serial_number = 9306
grid = make_grid(serial_number)

largest = {"x" => 0, "y" => 0, "sum" => 0}

grid_size.times do |x|
  next if x > grid_size - 3
  grid_size.times do |y|
    next if y > grid_size - 3
    sum = 0

    3.times do |x1|
      3.times do |y1|
        sum += grid[x + x1][y + y1]
      end
    end

    if sum > largest["sum"]
      largest = {"x" => x + 1, "y" => y + 1, "sum" => sum}
    end
  end
end

puts "#{largest["x"]},#{largest["y"]}"
