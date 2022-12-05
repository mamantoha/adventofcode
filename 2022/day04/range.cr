require "spec"

struct Range(B, E)
  # Returns `true` if `other` is a subrange the `self`.
  # Returns `false` otherwise.
  def includes?(other : Range) : Bool
    begin_value = @begin
    end_value = excludes_end? ? @end.try(&.pred) : @end

    other_begin_value = other.begin
    other_end_value = other.excludes_end? ? other.end.try(&.pred) : other.end

    (begin_value.nil? || (!other_begin_value.nil? && other_begin_value >= begin_value)) &&
      (end_value.nil? || (!other_end_value.nil? && other_end_value <= end_value))
  end

  # Compare two ranges and see if they overlap each other
  def overlaps?(other : Range) : Bool
    covers?(other.begin) || other.covers?(@begin)
  end
end

describe Range do
  describe "#includes?" do
    it { ((1..10).includes?((1..5))).should be_truthy }
    it { ((1..).includes?((1..))).should be_truthy }
    it { ((2..).includes?((1..))).should be_falsey }
    it { ((1..10).includes?((1..10))).should be_truthy }
    it { ((1..10).includes?((1...10))).should be_truthy }
    it { ((1..10).includes?((1...11))).should be_truthy }
    it { ((1..10).includes?((1..11))).should be_falsey }
    it { ((1...11).includes?((1..10))).should be_truthy }
    it { ((1...11).includes?((1..11))).should be_falsey }
    it { ((1..).includes?((1..5))).should be_truthy }
    it { ((..10).includes?((1..5))).should be_truthy }
    it { (('a'..'f').includes?(('a'..'c'))).should be_truthy }
    it { (('a'..'f').includes?(('a'...'c'))).should be_truthy }
    it { (('a'...'f').includes?(('a'..'c'))).should be_truthy }
    it { (('a'...'f').includes?(('a'...'c'))).should be_truthy }
    it { (('a'..'e').includes?(('a'...'f'))).should be_truthy }
    it { (('a'...'f').includes?(('a'..'f'))).should be_falsey }
  end

  describe "#overlaps?" do
    it { ((1..5).overlaps?((5..10))).should be_truthy }
    it { ((1..4).overlaps?((6..8))).should be_falsey }
    it { (('a'..'f').overlaps?(('a'..'e'))).should be_truthy }
    it { (('a'..'f').overlaps?(('x'..'z'))).should be_falsey }
  end
end
