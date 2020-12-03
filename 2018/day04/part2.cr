require "time"

lines = File.read_lines("input")
records = [] of NamedTuple(time: Time, string: String)

def parse_line(line : String)
  regex = /\A\[(?<time>.+)\] (?<string>.+)\z/

  if m = line.match(regex)
    time = Time.parse_utc(m["time"], "%Y-%m-%d %H:%M")
    return {time: time, string: m["string"]}
  end
end

lines.each do |line|
  record = parse_line(line)
  if record
    records << record
  end
end

ordered_records = records.sort_by { |rec| rec[:time] }

guards = Hash(Int32, Hash(Int32, Int32)).new

guard = nil
asleep = nil
awake = nil

ordered_records.each do |record|
  case record[:string]
  when regexp = /Guard #(?<guard>\d+) begins shift/
    if m = regexp.match(record[:string])
      guard = m["guard"].to_i
    end
  when /falls asleep/
    asleep = record[:time].minute
  when /wakes up/
    awake = record[:time].minute

    if guard && asleep
      (asleep...awake).each do |minute|
        (guards[guard] ||= Hash(Int32, Int32).new(0))[minute] += 1
      end
    end
  end
end

winner = guards.max_by { |guard, times| times.max_by { |min, count| count }[1] }
most_times = winner[1].max_by { |min, count| count }

puts winner[0] * most_times[0]
