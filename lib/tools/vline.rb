class VLine < Tool
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

    if !app.bitmap.bounds?(@x, @y1) || !app.bitmap.bounds?(@x, @y2)
      puts "ERR: Coordinates out of bounds"
      return
    end

    (@y1..@y2).each do |y|
      app.bitmap[@x, y] = @colour
    end
  end
end
