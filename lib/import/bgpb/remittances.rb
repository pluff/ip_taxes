module Import
  module Bgpb
    module Remittances
      class << self
        def build_from(filepath)
          docs = Import::Bgpb.parse(filepath)

          find_remittances(docs).map { |remittance_hash| build(remittance_hash) }
        end

        private

        def find_remittances(docs)
          docs.select { |doc| doc['CreQ'] > 0 }
        end

        def build(rhash)
          Remittance.new(currency: OfficialRates.code_to_text(rhash['I2']), amount: rhash['CreQ'], transferred_at: rhash['DocDate'])
        end
      end
    end
  end
end
