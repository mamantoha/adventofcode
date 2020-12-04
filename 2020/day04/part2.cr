file = File.read("input")

class Passport
  property ecl : String?
  property pid : String?
  property eyr : String?
  property hcl : String?
  property byr : String?
  property iyr : String?
  property cid : String?
  property hgt : String?

  def initialize(h : Hash(String, String))
    @h = h
    @byr = h["byr"]?
    @iyr = h["iyr"]?
    @eyr = h["eyr"]?
    @hgt = h["hgt"]?
    @hcl = h["hcl"]?
    @ecl = h["ecl"]?
    @pid = h["pid"]?
    @cid = h["cid"]?
  end

  def valid?
    return false unless required_fields_present?
    return false unless all_fields_valid?
    true
  end

  def required_fields_present?
    @ecl && @pid && @eyr && @hcl && @byr && @iyr && @hgt
  end

  def all_fields_valid?
    byr_valid? && iyr_valid? && eyr_valid? && hgt_valid? && hcl_valid? && ecl_valid? && pid_valid?
  end

  def byr_valid?
    byr = @byr.not_nil!

    1920 <= byr.to_i <= 2002
  end

  def iyr_valid?
    iyr = @iyr.not_nil!

    2010 <= iyr.to_i <= 2020
  end

  def eyr_valid?
    eyr = @eyr.not_nil!

    2020 <= eyr.to_i <= 2030
  end

  def hgt_valid?
    hgt = @hgt.not_nil!

    if match = hgt.match(/\A(\d+)(.*)\z/)
      n = match[1].to_i
      w = match[2]
      case w
      when "cm"
        150 <= n <= 193
      when "in"
        59 <= n <= 76
      else
        false
      end
    else
      false
    end
  end

  def hcl_valid?
    hcl = @hcl.not_nil!

    hcl.match(/\A#[a-f0-9]{6}\z/)
  end

  def ecl_valid?
    ecl = @ecl.not_nil!

    ecl.in?(%w(amb blu brn gry grn hzl oth))
  end

  def pid_valid?
    pid = @pid.not_nil!

    pid.match(/\A\d{9}\z/)
  end
end

lines = file.split("\n\n").map(&.gsub("\n", " "))

valid_passports = 0

lines.each do |line|
  fields = line.split

  h = {} of String => String

  fields.each do |field|
    k, v = field.split(":", 2)
    h[k] = v
  end

  passport = Passport.new(h)
  valid_passports += 1 if passport.valid?
end

puts valid_passports # => 137
