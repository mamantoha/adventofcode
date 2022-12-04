require "spec"

struct Range(B, E)
  def includes?(other : Range) : Bool
    begin_value = @begin
    end_value = @end

    other_begin_value = other.begin
    other_end_value = other.end

    other_end_value = other.excludes_end? ? other_end_value.try(&.pred) : other_end_value

    # begin passes
    (begin_value.nil? || (!other_begin_value.nil? && other_begin_value >= begin_value)) &&
      # end passes
      (end_value.nil? ||
        !other_end_value.nil? && (excludes_end? ? other_end_value < end_value : other_end_value <= end_value))
  end

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
    it { ((1..).includes?((1..5))).should be_truthy }
    it { ((..10).includes?((1..5))).should be_truthy }
  end

  describe "#overlaps?" do
    it { ((1..5).overlaps?((5..10))).should be_truthy }
    it { ((1..4).overlaps?((6..8))).should be_falsey }
  end
end
