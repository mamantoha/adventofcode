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
