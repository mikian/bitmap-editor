class Show < Tool
  register /S/
  desc 'S', 'Shows current bitmap'

  def execute(app)
    unless app.bitmap
      puts "ERR: No bitmap has been created"
      return
    end

    app.bitmap.rows.each do |row|
      puts row.join('')
    end
  end
end
