require "time"

lines = File.read_lines("input")
records = [] of NamedTuple(time: Time, string: String)

def parse_line(line : String)
  regex = /\A\[(?<time>.+)\] (?<string>.+)\z/

  if m = line.match(regex)
    time = Time.parse_utc(m["time"], "%Y-%m-%d %H:%M")
    return {time: time, string: m["string"] }
  end
end

lines.each do |line|
  record = parse_line(line)
  if record
    records << record
  end
end

ordered_records = records.sort_by { |rec| rec[:time]}

alias Minute = Int32
guards = Hash(Int32, Array(Array(Minute))).new(Array(Array(Minute)).new)

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
      (guards[guard] ||= [] of Array(Minute)) << [asleep, awake]
   end
  end
end

max = guards.max_by { |k, v| v.map { |v| v[1] - v[0] }.sum }
minutes = Hash(Int32, Int32).new(0)

max[1].each do |duration|
  (duration[0]...duration[1]).each do |minute|
    minutes[minute] += 1
  end
end

most_sleep_guard = max[0]

most_sleep_minute = minutes.max_by { |k, v| v }[0]

puts most_sleep_guard * most_sleep_minute
