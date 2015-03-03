class VLine < Tool
  register /V (\d+) (\d+) (\d+) ([A-Z])/
  desc 'V X1 Y1 Y2 C', 'Draws vertical line from X,Y1 to X,Y2 with colour C'

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
