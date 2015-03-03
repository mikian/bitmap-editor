class Tool
  # Registers a new tool to editor
  def self.register(re)
    tools[self] = Regexp.new("\\A#{re}\\Z")
  end

  # Defines usage text for tool to use in-program help
  def self.desc(usage, description)
    help << [usage, description]
  end

  def self.tools
    @@tools ||= {}
  end

  def self.help
    @@help ||= []
  end

  def self.parse(line)
    # Search for all registered tools which matches to given command
    cmd, re = tools.find{|cls, re| re.match(line)}
    if cmd
      return [cmd, re.match(line).to_a[1..-1]]
    end

    # Return empty command for unknown
    return [Noop, []]
  end

  # Actual execution of tool
  # Gets shared app state as argument
  def execute(app)
    fail "Not Implemented!"
  end
end

# Load all out tools
Dir[File.join(File.expand_path('../', __FILE__), 'tools', '*')].each {|f| require f}
