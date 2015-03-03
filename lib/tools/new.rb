class New < Tool
  register /I (\d+) (\d+)/
  desc 'I W H', 'Creates a new bitmap with given width W and height H'

  def initialize(width, height)
    @width = width.to_i
    @height = height.to_i
  end

  def execute(app)
    app.bitmap = Bitmap.new(@width, @height)
  end
end
