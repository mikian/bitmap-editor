class Command
  def self.register(re)
    commands[self] = Regexp.new("\\A#{re}\\Z")
  end

  def self.commands
    @@commands ||= {}
  end

  def self.parse(line)
    cmd, re = commands.find{|cls, re| re.match(line)}
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

# Load all out commands
Dir[File.join(File.expand_path('../', __FILE__), 'commands', '*')].each {|f| require f}
