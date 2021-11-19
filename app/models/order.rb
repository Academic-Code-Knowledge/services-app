class Order < ApplicationRecord
  belongs_to :user
  belongs_to :device
  belongs_to :service
  has_many :operations
  has_one :invoice



    def index 
      @orders = current_user.orders
      @operations = Operation.all
    end

    def status
      status = " "
      operations.each do |operation|
        status = operation.status
      end
      status
    end
end    