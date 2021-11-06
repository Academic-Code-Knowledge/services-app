class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to root_url
    end

    def after_sign_in_path_for(resource)
        if resource.role == 'admin' || resource.role == 'operator'
            admin_root_path
        else
            home_index_path
        end
    end
end
