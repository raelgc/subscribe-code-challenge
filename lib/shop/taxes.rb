# frozen_string_literal: true

module Shop
  # Tax calculation module
  module Taxes
    ROUNDING_FACTOR = 0.05
    BASIC_SALES_TAX_RATE = 0.10
    IMPORT_DUTY_RATE = 0.05

    EXEMPT_CATEGORIES = %w[
      book
      chocolate
      pill
    ].freeze

    def self.total_taxes(item)
      sales_tax(item) + import_duty(item)
    end

    def self.exempt?(item)
      EXEMPT_CATEGORIES.any? { |category| item.name.downcase.include?(category) }
    end

    def self.sales_tax(item)
      return 0 if exempt?(item)

      round_tax(item.price * BASIC_SALES_TAX_RATE)
    end

    def self.import_duty(item)
      return 0 unless item.imported

      round_tax(item.price * IMPORT_DUTY_RATE)
    end

    def self.round_tax(value)
      (value / ROUNDING_FACTOR).ceil * ROUNDING_FACTOR
    end
  end
end
