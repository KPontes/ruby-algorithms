class Rectangle
  attr_reader  :x, :y, :width, :height
 
  def initialize(x,y,width,height)
    # (x,y) are top_left coordinates of the rectangle
    @x = x
    @y  = y
    @width = width
    @height = height
  end
 
  def to_s
    "x:#{@x}, y:#{@y}, w:#{@width}, h:#{@height}, "
  end
  
  def intersect?(rect2)
    return !((x > rect2.x + rect2.width) || (x  + width < rect2.x) || (y > rect2.y + rect2.height) || (y + height < rect2.y))
  end
  
end

