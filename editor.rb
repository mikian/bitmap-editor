#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require

require './lib/cli'

cli = CLI.new
cli.start
