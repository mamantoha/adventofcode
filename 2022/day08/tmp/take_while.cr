# Passes elements to the block until the block returns a falsey value,
# then stops iterating and returns an `Array` of all prior elements.
#
# Accepts an optional *include_falsey* parameter, which tells it to include
# a falsey value to the result (defaults to `false`).
#
# ```
# [1, 2, 3, 4, 5, 0].take_while { |i| i < 3 }       # => [1, 2]
# [1, 2, 3, 4, 5, 0].take_while(true) { |i| i < 3 } # => [1, 2, 3]
# ```
module Enumerable(T)
  def take_while(include_falsey = false, & : T ->) : Array(T)
    result = Array(T).new

    each do |x|
      unless yield x
        result << x if include_falsey

        break
      end

      result << x
    end
    result
  end
end

p [4, 2, 5, 3, 3, 3].take_while { |e| e < 5 }
p [4, 2, 5, 3, 3, 3].take_while(true) { |e| e < 5 }
