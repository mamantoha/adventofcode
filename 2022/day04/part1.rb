# frozen_string_literal: true

file_path = 'input.txt'

lines = File
        .readlines(file_path, chomp: true)
        .map do |line|
          line
            .split(',').map { |p| p.split('-').map(&:to_i) }
            .map { |x| (x[0]..x[1]) }
        end

result = lines.count { |r| r[0].cover?(r[1]) || r[1].cover?(r[0]) }

puts result

# 456
