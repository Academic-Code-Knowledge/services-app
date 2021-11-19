module Admin
  class OperationController < AdminController
    before_action :authenticate_user!

    def index
      @orders = Order.all

      #@datos = Order.joins(:user).distinct.select("users.*,first_name")
      #puts "DATA: ", @datos
      #puts User.all
    end

    def procesar
      @stages = Stage.all
      id_de_orden = params[:id]
      @order = Order.find(id_de_orden)
      # @stage_filter = @stages.find_by(service_id: )
      #redirect_to admin_operation_procesar_path
    end
  end
end
