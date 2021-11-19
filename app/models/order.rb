class Order < ApplicationRecord
  belongs_to :user
  belongs_to :device
  belongs_to :service
  has_many :operations
  has_one :invoice

  def stage_count(id)
    order_1 = Order.all
    id_servicio = order_1.find_by(id: id).service_id
    stage = Stage.all
    stage.where(service_id: id_servicio).count()
  end

  def name_service(id)
    order = Order.all
    id_service = order.find_by(id: id).service_id
    service = Service.all
    Service.find_by(id: id_service).name
  end

  
end
