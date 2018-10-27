class NestedLoop

  def self.score(input)
    res = []
    for i in 0..input / 7 do
      for j in 0..input / 3 do
        for k in 0..input / 2 do
          res << [i,j,k] if k * 2 + j * 3 + i * 7 == input
        end
      end
    end
    res
  end

end
