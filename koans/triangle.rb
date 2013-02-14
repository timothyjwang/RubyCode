# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	side_a = a
	side_b = b
	side_c = c

	# Throw TriangleError under certain circumstances
		# First, no side in a triangle can have '0' length
	raise TriangleError if side_a == 0 || side_b == 0 || side_c == 0
		# Second, no side can be negative (less than 0)
	raise TriangleError if side_a < 0 || side_b < 0 || side_c < 0
		# On the side, the first and second circumstances, above, could be condensed as follows:
	# raise TriangleError if side_a <= 0 || side_b <= 0 || side_c <= 0
		# Third, the sum of any two sides (length) must be greater than the length of the third side
		# http://www.mathwarehouse.com/geometry/triangles/triangle-inequality-theorem-rule-explained.php
	raise TriangleError if (side_a + side_b <= side_c) ||  (side_b + side_c <= side_a) || (side_c + side_a <= side_b)

	if side_a == side_b && side_b == side_c
		:equilateral
	elsif side_a == side_b || side_b == side_c || side_c == side_a
		:isosceles
	else
		:scalene
	end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
