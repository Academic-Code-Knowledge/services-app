module Admin
  class OrderController < AdminController
    before_action :authenticate_user!
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index 
      if params[:user_id]
        @user = User.find_by(params[:user_id])
        @orders = @user.orders
      else
        @orders = Order.all
        @operations = Operation.all
      end
    end

    def new
      if params[:user_id]
        @user = User.find_by(params[:user_id])
        @orders = @user.orders.build
      else
        @order = Order.new
        @order.build_user
      end
    end

    def show
      params.permit!
      @order = Order.find(params[:id])
      # @order = current_user.orders.find(params[:id])
      # @user = @order.users.build
    end
    
    def create
      params.permit!
      @order = Order.new(params[:order])
      if @order.save
        redirect_to :action => :show, :id => @order.id
      else
        render admin_order_new_path




      # @order = current_user.order.build(order_params)
      # if @order.save
      #   flash[:notice] = "Orden creada correctamente"
      #   redirect_to admin_order_url(@order)
      # else
      #   render :action => 'new'
      end
    end


    # def create  
    #   params.permit!
    #   @order = Order.new(params[:order])
    #   if @order.save
    #     redirect_to :action => :show, :id => @order.id 
    #   else 
    #     render action: "new"
    #   end
    # end
    

    
    def edit
    
    end
    
    def update
      if @order.update(order_params)
        flash[:notice] = "Orden actualizada correctamente"
        redirect_to admin_order_url(@order)
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @order.destroy
      flash[:notice] = "Orden se eliminó correctamente"
      redirect_to admin_orders_url
    end
    
    private
    def set_order
      @order = Order.find(params[:id])
    end
  
    def order_params
      params.require(:order).permit(:date_in, :date_out, :date_real, :issue_description, :photo, :user_id, :device_id, :service_id)
    end


  end
end
