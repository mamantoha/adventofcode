# frozen_string_literal: true

file_path = 'input.txt'

lines = File
        .readlines(file_path, chomp: true)
        .map do |line|
          line
            .split(',').map { p.split('-').map(&:to_i) }
            .map { |p| (p[0]..p[1]) }
        end

result = lines.count { |p| p[0].cover?(p[1]) || p[1].cover?(p[0]) }

puts result

# 456
