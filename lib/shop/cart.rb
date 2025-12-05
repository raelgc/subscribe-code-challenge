# frozen_string_literal: true

module Shop
  # Shopping Cart (aka Basket)
  class Cart
    # @type [Shop::Item] items
    attr_reader :items

    def initialize
      @items = []
    end

    def empty?
      @items.empty?
    end

    def add(item)
      @items << item
    end

    def total
      @items.sum { |item| item.price_with_taxes * item.quantity }
    end

    def sales_taxes
      @items.sum { |item| item.taxes * item.quantity }
    end

    def to_s
      return 'Basket is empty' if empty?

      <<~OUTPUT

        #{@items.map(&:to_s).join("\n")}
        Sales Taxes: #{format('%.2f', sales_taxes)}
        Total: #{format('%.2f', total)}
      OUTPUT
    end
  end
end
