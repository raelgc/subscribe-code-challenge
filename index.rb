# frozen_string_literal: true

# Instantiate and run the CLI with the Parser
require_relative 'lib/parser'
require_relative 'lib/cli'

parser = Parser.new
cli = Cli.new(parser)
cli.run
