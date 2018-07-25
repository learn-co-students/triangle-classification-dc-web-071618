class Triangle
  attr_accessor :side1, :side2, :side3, :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if !sides_greater_than_zero?(side1, side2, side3) && triangle_inequality(side1, side2, side3)
      if equilateral?(side1, side2, side3)
        kind = :equilateral
      elsif scalene?(side1, side2, side3)
        kind = :scalene
      else
        kind = :isosceles
      end
    else
      raise TriangleError
    end
  end

  def triangle_inequality(side1, side2, side3)
    if (side1 + side2 > side3) && (side1 + side3 > side2) && (side2 + side3 > side1)
      true
    else
      false
    end
  end

  def sides_greater_than_zero?(*sides)
    sides.any? do |side|
      side < 0
    end
  end

  def equilateral?(side1, side2, side3)
    if side1 == side2 && side1 == side3
      true
    else
      false
    end
  end

  def scalene?(side1, side2, side3)
    if side1 != side2 && side1 != side3 && side2 != side3
      true
    else
      false
    end
  end

  class TriangleError < StandardError
  end
end
