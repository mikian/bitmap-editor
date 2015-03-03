class Light < Tool
  register /L (\d+) (\d+) ([A-Z])/
  desc 'L X Y C', 'Lights a pixel at X,Y with colour C'

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

    if !app.bitmap.bounds?(@x, @y)
      puts "ERR: Bitmap size is smaller than coordinates given"
      return
    end

    app.bitmap[@x, @y] = @colour
  end
end
