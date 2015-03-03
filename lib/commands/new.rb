require './lib/bitmap'

class New < Command
  register /I (\d+) (\d+)/

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
  end

  def execute(app)
    app.bitmap = Bitmap.new(@width, @height)
  end
end
