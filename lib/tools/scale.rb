class Scale < Tool
  register /W (\d+)/
  desc 'W P', 'Scales image up or down with given percentage.'

  def initialize(factor)
    @factor = factor.to_i / 100.0
  end

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    # Calculate new width, height
    width  = (app.bitmap.width  * @factor).round
    height = (app.bitmap.height * @factor).round

    # Create new bitmap
    bitmap = Bitmap.new(width, height)

    (1..height).each do |y|
      (1..width).each do |x|
        px = ((x-1)/@factor).floor + 1
        py = ((y-1)/@factor).floor + 1

        bitmap[x, y] = app.bitmap[px, py]
      end
    end

    app.bitmap = bitmap
  end
end
