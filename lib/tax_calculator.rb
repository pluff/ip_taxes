require 'lib/official_rates'

class TaxCalculator
  attr_reader :remittances, :exchanges

  def initialize(remittances, exchanges)
    @remittances = remittances
    @exchanges = exchanges
  end

  def tax_base
    entries.map { |e| e[:tax_base] }.sum
  end

  def remittances_taxes
    entries.select { |e| e[:type] == :remittance }
  end

  def exchanges_taxes
    entries.select { |e| e[:type] == :exchange }
  end

  def tax_rate
    Config.tax_rate
  end

  def tax_amount
    entries.map { |e| e[:tax_amount] }.sum
  end

  def entries
    @entries ||= begin
      remittances.map do |r|
        tax = {
          type: :remittance,
          object: r,
          tax_rate: tax_rate,
          official_rate: OfficialRates[r.transferred_at][r.currency]
        }
        tax[:tax_base] = r.amount * tax[:official_rate]
        tax[:tax_amount] = tax[:tax_base] * tax[:tax_rate]
        tax
      end + exchanges.map do |e|
        tax = {tax_rate: tax_rate, type: :exchange, object: e}

        tax[:official_rate] = OfficialRates[e.transferred_at][e.from_currency]
        tax[:tax_base] = (e.exchange_rate - tax[:official_rate]) * e.amount
        tax[:tax_base] = 0 if tax[:tax_base] < 0
        tax[:tax_amount] = tax[:tax_base] * tax[:tax_rate]
        tax
      end
    end
  end
end
