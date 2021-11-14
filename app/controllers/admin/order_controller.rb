class Admin::OrderController < ApplicationController
    before_action :authenticate_user!
  

    def index
      @orders = current_user.orders
      @operations = Operation.all
    end
end
