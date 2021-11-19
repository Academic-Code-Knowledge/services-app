class Admin::ServiceController < ApplicationController
  def index
    @services = Service.all
  end

 
  
  

end
