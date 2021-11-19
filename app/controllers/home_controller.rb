class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[landing]
  def landing
  end

  def index 
      @orders = current_user.orders
      @operations = Operation.all
      
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
    @order = current_user.orders.find(params[:id])
    @user = @order.users.build
  end
  
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:notice] = "Orden creada correctamente"
      redirect_to admin_order_url(@order)
    else
      render :action => 'new'
    end
  end
  
  def edit
   
  end

  
end
