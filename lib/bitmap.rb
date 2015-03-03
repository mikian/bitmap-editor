class Bitmap
  attr_reader :width, :height, :data

  def initialize(width, height)
    # Creates a new empty bitmap with white colour (O)
    @width = width
    @height = height
    @data = Array.new(width * height, 'O')
  end

  def bounds?(x, y)
    x <= @width && y <= @height
  end

  def [](x, y)
    @data[(y-1)*@width+(x-1)]
  end

  def []=(x, y, val)
    @data[(y-1)*@width+(x-1)] = val
  end

  def rows
    @data.each_slice(@width)
  end
end
