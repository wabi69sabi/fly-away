class Split
  def self.sell_coins(input)
    a = split_em(input)
    o = [a.first]

    until o.flatten.last == input.last
      a = split_em(a.last)
      o << a.first
    end

    # just to see the created split array uncomment next line
    @split_array = o
    return_max(o)
  end

  def self.split_em(array)
    array.slice_after(array.max).to_a
  end

  def self.return_max(totals)
    res = []
    totals.each {|a| res << a.max - a.min}
    return res.max
  end

  def self.return_array
    return @split_array
  end
end
