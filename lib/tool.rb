class Tool
  def self.register(re)
    tools[self] = Regexp.new("\\A#{re}\\Z")
  end

  def self.tools
    @@tools ||= {}
  end

  def self.parse(line)
    cmd, re = tools.find{|cls, re| re.match(line)}
    if cmd
      return [cmd, re.match(line).to_a[1..-1]]
    end

    # Return empty command for unknown
    return [Noop, []]
  end

  def execute(app)
    fail "Not Implemented!"
  end
end

# Load all out tools
Dir[File.join(File.expand_path('../', __FILE__), 'tools', '*')].each {|f| require f}
