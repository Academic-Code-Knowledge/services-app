class Stage < ApplicationRecord
  belongs_to :service

  def id_service(id)
    etapa = Stage.all
    id_service = etapa.find_by(id: id).service_id
    algo = etapa.where(service_id: id_service)
  end
end
