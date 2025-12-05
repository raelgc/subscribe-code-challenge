# frozen_string_literal: true

require_relative 'spec_helper'

# Parser Specs
class ParserSpec
  def self.run
    test_basic_item
    test_imported_item
    test_complex_item_names
  end

  def self.test_basic_item
    result = parse_input('2 book at 12.49')

    raise "Expected quantity 2, got #{result[:quantity]}" unless result[:quantity] == 2
    raise "Expected imported false, got #{result[:imported]}" unless result[:imported] == false
    raise "Expected name 'book', got '#{result[:name]}'" unless result[:name] == 'book'
    raise "Expected price 12.49, got #{result[:price]}" unless (result[:price] - 12.49).abs < 0.01
  end

  def self.test_imported_item
    result = parse_input('1 imported bottle of perfume at 27.99')

    raise "Expected quantity 1, got #{result[:quantity]}" unless result[:quantity] == 1
    raise "Expected imported true, got #{result[:imported]}" unless result[:imported] == true
    raise "Expected name 'bottle of perfume', got '#{result[:name]}'" unless result[:name] == 'bottle of perfume'
    raise "Expected price 27.99, got #{result[:price]}" unless (result[:price] - 27.99).abs < 0.01
  end

  def self.test_complex_item_names
    result = parse_input('1 packet of headache pills at 9.75')

    return if result[:name] == 'packet of headache pills'

    raise "Expected name 'packet of headache pills', got '#{result[:name]}'"
  end
end
