# frozen_string_literal: true

require_relative '../lib/parser'
require_relative '../lib/cli'
require_relative '../lib/shop/item'
require_relative '../lib/shop/cart'
require_relative '../lib/shop/taxes'

# Simple test helper methods
def parse_input(input)
  parser = Parser.new
  parser.run(input)
end

def create_item(input)
  parsed_data = parse_input(input)
  Shop::Item.new(
    quantity: parsed_data[:quantity],
    imported: parsed_data[:imported],
    name: parsed_data[:name],
    price: parsed_data[:price],
  )
end

def create_cart_from_inputs(inputs)
  cart = Shop::Cart.new
  inputs.each do |input|
    item = create_item(input)
    cart.add(item)
  end
  cart
end
