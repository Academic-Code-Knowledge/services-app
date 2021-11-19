module Admin
  class OperationController < AdminController
    before_action :authenticate_user!

    def index
      @orders = Order.all
      @operations = Operation.all
    end

    def procesar
      @stages = Stage.all
      id_de_orden = params[:id]
      @order = Order.find(id_de_orden)
    end
  end
end
