require 'active_model'

class Remittance
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :float
  attribute :currency, :string
  attribute :transferred_at, :datetime
end
