class Clear < Tool
  register /C/
  desc "C", "Clears image"

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    app.bitmap.data.fill('O')
  end
end
