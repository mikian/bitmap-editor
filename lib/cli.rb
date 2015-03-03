#
# Copyright 2015 Mikko Kokkonen
# All Rights Reserved

require 'readline'

require './lib/app'
require './lib/bitmap'
require './lib/tool'

class CLI
  attr_reader :app

  def initialize
    @app = App.new
  end

  def start
    loop do
      line = Readline::readline('> ')
      cmd, params = Tool.parse(line)

      # Quit if requested
      break if cmd == Terminate

      # Load and execute command
      cmd.new(*params).execute(app)

      Readline::HISTORY.push(line)
    end
  end

  private
end
