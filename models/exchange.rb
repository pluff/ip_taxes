require 'active_model'

class Exchange
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :float
  attribute :from_currency, :string
  attribute :to_currency, :string
  attribute :exchange_rate, :float
  attribute :transferred_at, :datetime
end
