class FastArray
  def self.get_highest_value(array)
    @diff = []
    array.each_with_index do |value, index|
      next if index == 0
      array[0..index - 1].each do |closing_value|
        @diff.push(value - closing_value)
      end
    end
    @diff.max
  end

  def self.return_array
    return @diff
  end
end
