reports = File
  .read_lines("input.txt")
  .map(&.split(' ').map(&.to_i))

safe_reports = reports.size

reports.each do |report|
  unless safe_report?(report)
    safe_report = false

    report.size.times do |i|
      tmp_report = report.dup
      tmp_report.delete_at(i)

      if safe_report?(tmp_report)
        safe_report = true

        break
      end
    end

    safe_reports -= 1 unless safe_report
  end
end

def safe_report?(report : Array(Int32)) : Bool
  unless report == report.sort.uniq || report == report.sort.reverse.uniq
    return false
  end

  report.each_cons_pair do |a, b|
    if (a - b).abs > 3
      return false
    end
  end

  true
end

puts safe_reports
# 400
