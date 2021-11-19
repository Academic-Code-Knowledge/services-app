module Admin
  class HomeController < AdminController
    before_action :authenticate_user!
    
     end
end


