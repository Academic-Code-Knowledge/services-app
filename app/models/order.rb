class Order < ApplicationRecord
  belongs_to :user
  belongs_to :device
  belongs_to :service
  has_many :operations
  has_one :invoice
end
