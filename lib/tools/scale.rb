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

    # Fill new bitmap
    (1..height).each do |y|
      (1..width).each do |x|
        # Determine original pixel coordinates to be copied
        px = ((x-1)/@factor).floor + 1
        py = ((y-1)/@factor).floor + 1

        # Copy piel colour
        bitmap[x, y] = app.bitmap[px, py]
      end
    end

    # Store new bitmap to app
    app.bitmap = bitmap
  end
end
