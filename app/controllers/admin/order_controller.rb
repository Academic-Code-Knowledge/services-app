module Admin
    class OrderController < AdminController
      before_action :authenticate_user!
  
      def index
      end
      def new
      end
      def create  
        params.permit!
        @order = Order.new(params[:order])
        if @order.save
          redirect_to :action => :show, :id => @order.id 
        else 
          render action: "new"
        end
      end
      def show
        @order = Order.find(params[:id])
      end
    end
  end
  