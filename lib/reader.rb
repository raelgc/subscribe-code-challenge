# frozen_string_literal: true

# Reader class to handle user input
class Reader
  attr_reader :parser, :cart

  def initialize(parser, cart)
    @parser = parser
    @cart = cart
  end

  def process_items
    loop do
      input = gets.chomp
      next if input.strip.empty?

      add_item_to_cart(input)
    end
  end

  private

  def add_item_to_cart(input)
    parsed_data = @parser.run(input)
    item = Shop::Item.new(
      quantity: parsed_data[:quantity],
      imported: parsed_data[:imported],
      name: parsed_data[:name],
      price: parsed_data[:price],
    )
    @cart.add(item)
  end
end
