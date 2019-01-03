module Config
  class << self
    attr_accessor :currency, :remittances_path, :exchanges_path, :tax_rate
  end
end
