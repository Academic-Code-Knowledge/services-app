module Admin
    class AdminController < ApplicationController
        # Daniel
        before_action :authenticate_user!
        layout 'admin/application'
    end
end