class VLine < Command
  register /V (\d+) (\d+) (\d+) ([A-Z])/

  def initialize(x, y1, y2, colour)
    @x = x.to_i
    @y1 = y1.to_i
    @y2 = y2.to_i
    @colour = colour
  end

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    (@y1..@y2).each do |y|
      app.bitmap.data[(y-1)*app.bitmap.width+@x] = @colour
    end
  end
end
