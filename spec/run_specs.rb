#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'parser_spec'
require_relative 'cart_spec'
require_relative 'challenge_spec'

# Test runner
class SpecRunner
  def self.run
    ParserSpec.run
    CartSpec.run
    ChallengeSpec.run
    puts 'All specs passed'
  rescue StandardError => e
    puts "Spec failed: #{e.message}"
    exit 1
  end
end

SpecRunner.run if __FILE__ == $PROGRAM_NAME
