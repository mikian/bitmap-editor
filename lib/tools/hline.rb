class HLine < Tool
  register /H (\d+) (\d+) (\d+) ([A-Z])/

  def initialize(x1, x2, y, colour)
    @x1 = x1.to_i
    @x2 = x2.to_i
    @y = y.to_i
    @colour = colour
  end

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    (@x1..@x2).each do |x|
      app.bitmap[x, @y] = @colour
    end
  end
end
