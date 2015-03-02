class Show < Command
  register /S/

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    app.bitmap.data.each_slice(app.bitmap.width) do |line|
      puts line.join('')
    end
  end
end
