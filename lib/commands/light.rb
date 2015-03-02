class Light < Command
  register /L (\d+) (\d+) ([A-Z])/

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

    if app.bitmap.width < @x || app.bitmap.height < @y
      puts "ERR: Bitmap size is smaller than coordinates given"
      return
    end

    app.bitmap.data[(@y-1)*app.bitmap.width+(@x-1)] = @colour
  end
end
