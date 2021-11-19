class Service < ApplicationRecord
    has_many :stages
    validates :name, presence: true
end
