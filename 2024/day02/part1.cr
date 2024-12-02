reports = File
  .read_lines("input.txt")
  .map(&.split(' ').map(&.to_i))

safe_reports = reports.size

reports.each do |report|
  unless report == report.sort.uniq || report == report.sort.reverse.uniq
    safe_reports -= 1

    next
  end

  report.each_cons_pair do |a, b|
    if (a - b).abs > 3
      safe_reports -= 1

      break
    end
  end
end

puts safe_reports
# 334
