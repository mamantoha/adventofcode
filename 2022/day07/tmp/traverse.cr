iter = File.read_lines("#{__DIR__}/../input_example.txt").each

current_path = [] of String

line = iter.next

loop do
  run_next_command = true

  break if line.is_a?(Iterator::Stop)

  if line.starts_with?('$') # command
    command, *args = line.lchop("$ ").split(' ', 2)

    case command
    when "cd"
      if args[0] == ".."
        current_path.pop
      else
        current_path.push(args[0])
      end

      p! current_path
    when "ls"
      loop do
        line = iter.next

        break if line.is_a?(Iterator::Stop)

        if line.starts_with?('$')
          run_next_command = false

          break
        end

        dir_or_size, name = line.split(' ')

        size = if dir_or_size == "dir"
                 0
               else
                 dir_or_size.to_i
               end

        p! size
      end
    end
  end

  line = iter.next if run_next_command
end
