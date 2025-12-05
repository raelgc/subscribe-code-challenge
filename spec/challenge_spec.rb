# frozen_string_literal: true

require_relative 'spec_helper'

# Integration Specs for Challenge Examples
class ChallengeSpec
  def self.run
    test_input_one
    test_input_two
    test_input_three
  end

  def self.test_input_one
    inputs = [
      '2 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85',
    ]

    cart = create_cart_from_inputs(inputs)

    verify_totals_for_input_one(cart)
    verify_item_prices_for_input_one(cart)
  end

  def self.verify_totals_for_input_one(cart)
    expected_sales_tax = 1.50
    expected_total = 42.32

    unless (cart.sales_taxes - expected_sales_tax).abs < 0.01
      raise "Input 1: Expected sales tax #{expected_sales_tax}, got #{cart.sales_taxes}"
    end
    raise "Input 1: Expected total #{expected_total}, got #{cart.total}" unless (cart.total - expected_total).abs < 0.01
  end

  def self.verify_item_prices_for_input_one(cart)
    # Check individual item prices with taxes
    items = cart.items

    verify_book_price(items[0])
    verify_cd_price(items[1])
    verify_chocolate_price(items[2])
  end

  def self.verify_book_price(item)
    # 2 book: 24.98 (no tax)
    book_total = item.price_with_taxes * item.quantity
    raise "Input 1: Expected book total 24.98, got #{book_total}" unless (book_total - 24.98).abs < 0.01
  end

  def self.verify_cd_price(item)
    # 1 music CD: 16.49 (14.99 + 1.50 tax)
    cd_total = item.price_with_taxes * item.quantity
    raise "Input 1: Expected CD total 16.49, got #{cd_total}" unless (cd_total - 16.49).abs < 0.01
  end

  def self.verify_chocolate_price(item)
    # 1 chocolate bar: 0.85 (no tax)
    chocolate_total = item.price_with_taxes * item.quantity
    raise "Input 1: Expected chocolate total 0.85, got #{chocolate_total}" unless (chocolate_total - 0.85).abs < 0.01
  end

  def self.test_input_two
    inputs = [
      '1 imported box of chocolates at 10.00',
      '1 imported bottle of perfume at 47.50',
    ]

    cart = create_cart_from_inputs(inputs)

    expected_sales_tax = 7.65
    expected_total = 65.15

    unless (cart.sales_taxes - expected_sales_tax).abs < 0.01
      raise "Input 2: Expected sales tax #{expected_sales_tax}, got #{cart.sales_taxes}"
    end
    raise "Input 2: Expected total #{expected_total}, got #{cart.total}" unless (cart.total - expected_total).abs < 0.01
  end

  def self.test_input_three
    inputs = [
      '1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '3 imported boxes of chocolates at 11.25',
    ]

    cart = create_cart_from_inputs(inputs)

    expected_sales_tax = 7.90
    expected_total = 98.38

    unless (cart.sales_taxes - expected_sales_tax).abs < 0.01
      raise "Input 3: Expected sales tax #{expected_sales_tax}, got #{cart.sales_taxes}"
    end
    raise "Input 3: Expected total #{expected_total}, got #{cart.total}" unless (cart.total - expected_total).abs < 0.01
  end
end
