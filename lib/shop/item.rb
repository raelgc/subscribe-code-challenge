# frozen_string_literal: true

require_relative 'taxes'

module Shop
  # Shop Item (aka Good)
  class Item
    attr_reader :quantity, :imported, :name, :price

    def initialize(quantity:, imported:, name:, price:)
      @quantity = quantity
      @imported = imported
      @name = name
      @price = price
    end

    def taxes
      Taxes.total_taxes(self)
    end

    def price_with_taxes
      @price + taxes
    end

    def to_s
      total_price = price_with_taxes * @quantity
      item_description = @imported ? "imported #{@name}" : @name
      "#{@quantity} #{item_description}: #{format('%.2f', total_price)}"
    end
  end
end
