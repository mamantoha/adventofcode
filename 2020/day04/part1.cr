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
    @ecl = h["ecl"]?
    @pid = h["pid"]?
    @eyr = h["eyr"]?
    @hcl = h["hcl"]?
    @byr = h["byr"]?
    @iyr = h["iyr"]?
    @cid = h["cid"]?
    @hgt = h["hgt"]?
  end

  def valid?
    return false unless @ecl && @pid && @eyr && @hcl && @byr && @iyr && @hgt
    true
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

puts valid_passports # => 202
