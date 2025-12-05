# frozen_string_literal: true

require_relative 'shop/cart'
require_relative 'shop/item'
require_relative 'reader'

# Command Line Interface class
class Cli
  def initialize(parser)
    @parser = parser
    @cart = Shop::Cart.new
  end

  def run
    puts "Enter item details (e.g., '1 imported bottle of perfume at 27.99'):"
    puts 'Press Ctrl+C when finished to see totals.'

    begin
      Reader.new(@parser, @cart).process_items
    rescue StandardError => e
      puts "Error parsing item: #{e.message}"
    rescue Interrupt
      display_final_receipt
    end
  end

  def display_final_receipt
    puts "\n\nFinal receipt:"
    puts @cart
  end
end
