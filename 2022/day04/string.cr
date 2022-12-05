require "spec"

class String
  def split_once
    split(2)
  end

  def split_once(&block : String -> _)
    split(2, &block)
  end

  # Splits the string on the first occurrence of the specified delimiter and returns prefix before delimiter and suffix after delimiter.
  def split_once(separator, remove_empty = false) : Array(String)
    split(separator, 2, remove_empty: remove_empty)
  end

  def split_once(separator, *, remove_empty = false, &block : String -> _)
    split(separator, 2, remove_empty: remove_empty, &block)
  end
end

describe Range do
  describe "#split_once" do
    describe "by whitespace" do
      it { ("foo bar".split_once).should eq(["foo", "bar"]) }
      it { ("foo bar baz".split_once).should eq(["foo", "bar baz"]) }
      it "with block" do
        ary = [] of String

        "foo bar".split_once { |string| ary << string }

        ary.should eq(["foo", "bar"])
      end
    end

    describe "by char" do
      it { ("foo=bar".split_once('=')).should eq(["foo", "bar"]) }
      it { ("foo=bar=baz".split_once('=')).should eq(["foo", "bar=baz"]) }

      it "split with block" do
        ary = [] of String

        "foo=bar".split_once('=') { |string| ary << string }

        ary.should eq(["foo", "bar"])
      end
    end

    describe "by string" do
      it { ("foo=bar".split_once("=")).should eq(["foo", "bar"]) }
      it { ("foo=bar=baz".split_once("=")).should eq(["foo", "bar=baz"]) }

      it "split with block" do
        ary = [] of String

        "foo=bar".split_once("=") { |string| ary << string }

        ary.should eq(["foo", "bar"])
      end
    end

    describe "by regex" do
      it { ("foo=bar".split_once(/\=/)).should eq(["foo", "bar"]) }
      it { ("foo=bar=baz".split_once(/\=/)).should eq(["foo", "bar=baz"]) }

      it "split with block" do
        ary = [] of String

        "foo=bar".split_once(/\=/) { |string| ary << string }

        ary.should eq(["foo", "bar"])
      end
    end
  end
end
