file = File.read("input")

dots, instructions = file.split("\n\n")

dots = dots.lines.map(&.split(',').map(&.to_i))

max_x = dots.max_of { |dot| dot[0] } + 1
max_y = dots.max_of { |dot| dot[1] } + 1

array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

instructions.lines.each do |instuction|
  if match = instuction.match(/fold along (?<along>x|y)=(?<line>\d+)/)
    along = match["along"]
    line = match["line"].to_i
  end

  along = along.not_nil!
  line = line.not_nil!

  new_dots = [] of Array(Int32)

  if along == "y"
    max_y = line
    new_array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

    array.each_with_index do |row, y|
      row.each_with_index do |dot, x|
        if [x, y].in?(dots)
          if y > line
            new_array[line - (y - line)][x] = '#'
            new_dots << [x, line - (y - line)]
          else
            new_array[y][x] = '#'
            new_dots << [x, y]
          end
        end
      end
    end

    array = new_array
  else
    max_x = line
    new_array = Array(Array(Char)).new(max_y) { Array(Char).new(max_x, '.') }

    array.each_with_index do |row, y|
      row.each_with_index do |dot, x|
        if [x, y].in?(dots)
          if x > line
            new_array[y][line - (x - line)] = '#'
            new_dots << [line - (x - line), y]
          else
            new_array[y][x] = '#'
            new_dots << [x, y]
          end
        end
      end
    end

    array = new_array
  end

  dots = new_dots

  array.each { |l| p l.join }
  puts
end
