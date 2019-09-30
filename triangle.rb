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
    validate_triangle a, b, c 

    if a == b && b == c
        # all equal sides
        :equilateral
    elsif a != b && b != c && c != a
        # all different
        :scalene
    else
        # well... 2 equal
        :isosceles
    end
end

#returns true if the sides make up for a valid triangle
def validate_triangle(*sides)

    if sides.size != 3
        raise TriangleError, 'triangles have 3 sides! no more, no less'
    end

    for side in sides
        # accounting for 0 or negative side length 
        if side <= 0
            raise TriangleError, 'triangle side length must be greather than 0'
        end
    end

    sides.sort
    if sides[0] + sides[1] <= sides[2]
        raise TriangleError, 'Can\'t form a triangle with those sides'
    end
end


# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
