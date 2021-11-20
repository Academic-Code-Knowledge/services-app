module Admin
  class HomeController < AdminController
    before_action :authenticate_user!
    def index
      @operators = User.where(role: "operator").all
      puts @operators
      @pie_data = Hash.new
      @operators.each do |operator|
        @pie_data[operator.first_name] = operator.orders.count
      end
      @orders = Order.all
      @services = Service.all
      @all_services = Hash.new
      @services.each do |service|
        @all_services[service.name] = 0
      end  
      @orders.each do |order|
        @all_services[order.service.name] += order.service.amount
      end  
    end
  end
end


