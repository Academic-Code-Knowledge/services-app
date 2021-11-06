module Admin
  class UsersController < AdminController
    before_action :authenticate_user!

    def index
    end
  end
end
