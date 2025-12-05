# frozen_string_literal: true

require_relative 'spec_helper'

# Cart and Item Specs
class CartSpec
  def self.run
    test_item_tax_calculation
    test_exempt_items
    test_cart_totals
  end

  def self.test_item_tax_calculation
    # Music CD should have 10% tax (non-exempt, non-imported)
    item = create_item('1 music CD at 14.99')
    expected_tax = 1.50 # 14.99 * 0.10 = 1.499, rounded up to nearest 0.05 = 1.50

    raise "Expected tax #{expected_tax}, got #{item.taxes}" unless (item.taxes - expected_tax).abs < 0.01
  end

  def self.test_exempt_items
    # Book should be exempt from basic sales tax
    book = create_item('1 book at 12.49')
    raise 'Book should be exempt from basic sales tax' unless book.taxes == 0.0

    # Chocolate should be exempt
    chocolate = create_item('1 chocolate bar at 0.85')
    raise 'Chocolate should be exempt from basic sales tax' unless chocolate.taxes == 0.0
  end

  def self.test_cart_totals
    cart = Shop::Cart.new
    cart.add(create_item('2 book at 12.49'))
    cart.add(create_item('1 music CD at 14.99'))
    cart.add(create_item('1 chocolate bar at 0.85'))

    expected_sales_tax = 1.50
    expected_total = 42.32

    unless (cart.sales_taxes - expected_sales_tax).abs < 0.01
      raise "Expected sales tax #{expected_sales_tax}, got #{cart.sales_taxes}"
    end
    raise "Expected total #{expected_total}, got #{cart.total}" unless (cart.total - expected_total).abs < 0.01
  end
end
