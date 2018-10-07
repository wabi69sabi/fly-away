class SpiralMatrix
  def self.spiral(matrix)
    (row = matrix.shift) ? row + spiral(matrix.transpose.reverse) : []
  end
end
