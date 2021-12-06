array = File.read("input").chomp.split(',').map(&.to_i)

hash = Hash(Int32, Int64).new { 0_i64 }

array.each { |i| hash[i] += 1_i64 }

days = 256

days.times do |day|
  new_hash = Hash(Int32, Int64).new { 0_i64 }

  hash.each do |k, v|
    if k.zero?
      new_hash[6] += v
      new_hash[8] += v
    else
      new_hash[k - 1] += v
    end
  end

  hash = new_hash
end

p hash.values.sum # => 1757714216975
