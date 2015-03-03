class Fill < Tool
  register /F (\d+) (\d+) ([A-Z])/

  def initialize(x, y, colour)
    @x = x.to_i
    @y = y.to_i
    @colour = colour
  end

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    unless app.bitmap.bounds?(@x, @y)
      puts "ERR: Coordinates out of bounds"
      return
    end

    @original_colour = app.bitmap[@x, @y]
    @bitmap = app.bitmap

    fill(@x, @y)
  end

  private
  def fill(x, y)
    return unless @bitmap.bounds?(x, y) && @bitmap[x, y] == @original_colour

    @bitmap[x, y] = @colour

    fill(x + 1, y)
    fill(x, y + 1)
    fill(x - 1, y)
    fill(x, y - 1)
  end
end
