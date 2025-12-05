# Sales Tax Calculator

A Ruby application that calculates sales tax and import duty for shopping items.

## How to Run

### Main Application
```bash
ruby index.rb
```
Then enter items one by one in the format: `quantity item_name at price`. Example:

    1 book at 12.49

Press Ctrl+C when finished to see the receipt.

### Run Tests
```bash
ruby spec/run_specs.rb
```

## Tax Rules

- **Basic Sales Tax**: 10% on all goods except books, food (chocolate), and medical products (pills)
- **Import Duty**: Additional 5% on all imported goods
- **Rounding**: Tax amounts are rounded up to the nearest 0.05

## Test Coverage

The specs cover:
- **Parser specs**: Input parsing and validation
- **Cart/Item specs**: Tax calculation logic
- **Integration specs**: All three challenge examples from the requirements

All specs test against the exact input/output examples from the challenge requirements.
