module Import
  module Bgpb
    module Exchanges
      class << self
        def build_from(filepath)
          docs = Import::Bgpb.parse(filepath)

          find_exchanges(docs).map { |ehash| build(ehash) }
        end

        private

        def find_exchanges(docs)
          docs.select { |doc| doc['Credit'] && doc['Credit'] > 0 }
        end

        def build(hash)
          rate = /курс(у?) (?<rate>\d+\.\d*)/i.match(hash['Nazn'])[:rate].to_f
          Exchange.new(
            from_currency: Config.currency,
            to_currency: 'BYN',
            amount: hash['Credit']/rate,
            transferred_at: hash['DocDate'],
            exchange_rate: rate
          )
        end
      end
    end
  end
end
