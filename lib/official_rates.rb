require 'nbrb-api'

module OfficialRates
  LOCAL_CURRENCY = 'BYN'.freeze
  CURRENCY_CODES = {
    '840' => 'USD',
    '978' => 'EUR',
    '933' => 'BYN',
    '643' => 'RUB'
  }.freeze

  class << self
    def [](date)
      @rates ||= {}
      date = date.to_date
      unless @rates[date]
        @rates[date] = {}
        api_response = Nbrb::Api.daily_rates(date)
        api_response.map do |key, currency_row|
          @rates[date][key] = currency_row[:cur_official_rate].to_f / currency_row[:cur_scale].to_f
        end
        @rates[date][LOCAL_CURRENCY] = 1
      end
      @rates[date]
    end

    def code_to_text(code)
      CURRENCY_CODES[code.to_s]
    end
  end
end
