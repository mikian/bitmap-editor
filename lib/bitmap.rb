class Bitmap
  attr_reader :width, :height, :data

  def initialize(width, height)
    # Creates a new empty bitmap with white colour (O)
    @width = width
    @height = height
    @data = Array.new(width * height, 'O')
  end
end
