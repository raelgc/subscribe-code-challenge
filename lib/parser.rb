# frozen_string_literal: true

# Parser class for each line of input
class Parser
  # Example line(s) to match:
  # 2 book at 12.49
  # 1 chocolate bar at 0.85
  # 1 imported box of chocolates at 10.00
  # 1 imported bottle of perfume at 27.99
  # 1 bottle of perfume at 18.99
  # 1 packet of headache pills at 9.75
  # 3 imported boxes of chocolates at 11.25
  REGEX = /(\d+)\s+(imported)?\s?(.*?)\sat\s(\d+\.\d{2})/

  def run(input)
    parse(input)
  end

  private

  def parse(input)
    matches = input.match(REGEX)
    raise ArgumentError, "Invalid input format: #{input}" unless matches

    quantity = matches[1].to_i
    imported = !matches[2].nil?
    name = matches[3].strip
    price = matches[4].to_f

    { quantity: quantity, imported: imported, name: name, price: price }
  end
end
