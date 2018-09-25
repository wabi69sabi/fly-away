class Split
  def self.sell_coins(input)
    a = split_em(input)
    o = [a.first]

    until o.flatten.last == input.last
      if a.flatten.count(a.flatten.max) > 1
        a.delete(a.first)
        a = split_em(a.flatten)
      else
        a = split_em(a.last)
      end
      o << a.first
    end

    @split_array = o
    return_max(o)
  end

  def self.split_em(array)
    array.slice_after(array.max).to_a
  end

  def self.return_max(totals)
    (totals.each_with_object([]) {|a, ar| ar << a.max - a.min}).max
  end

  def self.return_array
    return @split_array
  end
end
