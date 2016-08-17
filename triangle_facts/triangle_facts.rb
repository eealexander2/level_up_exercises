class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1, side2, side3].uniq.length == 2
  end

  def scalene?
    !equilateral? || !isosceles?
  end

  def right_angle?
    angles.include? 90
  end

  def triangle_facts
    puts "This triangle is equilateral" if equilateral?
    puts "This triangle is isosceles!" if isosceles?
    puts "This triangle is scalene and mathematically boring." if scalene?
    puts "This triangle is also a right triangle!" if right_angle?
    puts "The angles of this triangle are #{angles.join(',')}."
  end

  def angles
    [calculate_angles(side2, side3, side1),
     calculate_angles(side1, side3, side2),
     calculate_angles(side1, side2, side3)]
  end

  def calculate_angles(first_side, second_side, opposite_side)
    numerator = (first_side**2 + second_side**2 - opposite_side**2)
    denominator = (2.0 * first_side * second_side)
    degrees(Math.acos(numerator / denominator))
  end

  def degrees(rads)
    (rads * 180 / Math::PI).round
  end
end

triangle = Triangle.new(9, 13, 15)
triangle.triangle_facts
