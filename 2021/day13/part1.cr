file = File.read("input")

dots, instructions = file.split("\n\n")

instuction = instructions.lines.first

if match = instuction.match(/fold along (?<along>x|y)=(?<line>\d+)/)
  along = match["along"]
  line = match["line"].to_i
end

along = along.not_nil!
line = line.not_nil!

dots = dots.lines.map(&.split(',').map(&.to_i))

max_x = dots.max_of { |dot| dot[0] } + 1
max_y = dots.max_of { |dot| dot[1] } + 1

array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

max_y.times do |y|
  max_x.times do |x|
    if [x, y].in?(dots)
      array[y][x] = '#'
    end
  end
end

if along == "y"
  max_y = line
  new_array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

  array.each_with_index do |row, y|
    row.each_with_index do |dot, x|
      if [x, y].in?(dots)
        if y > line
          new_array[line - (y - line)][x] = '#'
        else
          new_array[y][x] = '#'
        end
      end
    end
  end

  p new_array.sum { |row| row.count { |e| e == '#' } }
else
  max_x = line
  new_array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

  array.each_with_index do |row, y|
    row.each_with_index do |dot, x|
      if [x, y].in?(dots)
        if x > line
          new_array[y][line - (x - line)] = '#'
        else
          new_array[y][x] = '#'
        end
      end
    end
  end

  p new_array.sum { |row| row.count { |e| e == '#' } }
end
