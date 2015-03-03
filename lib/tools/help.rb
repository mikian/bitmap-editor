class Help < Tool
  register /\?/
  desc '?', 'Shows all supported tools'

  def execute(_)
    Tool.help.each do |usage, description|
      puts "%-10s\t%s" % [usage, description]
    end
  end
end
