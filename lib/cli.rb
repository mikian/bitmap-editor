#
# Copyright 2015 Mikko Kokkonen
# All Rights Reserved

require 'readline'
require './lib/app'
require './lib/bitmap'
require './lib/command'

class CLI
  attr_reader :app

  def initialize
    @app = App.new
  end

  def start
    loop do
      line = Readline::readline('> ')
      # Short cut to termiante session
      cmd, params = Command.parse(line)

      # Quit if requested
      break if cmd == Terminate

      # Load and execute command
      cmd.new(*params).execute(app)

      Readline::HISTORY.push(line)
      puts "You typed: #{cmd} #{params.inspect}"
    end
  end

  private
end
