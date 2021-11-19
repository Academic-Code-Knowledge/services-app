module Admin
  class ServicesController < AdminController
    before_action :authenticate_user!
    def index
      @services = Service.all      
    end
    def new
      @service = Service.new
      respond_to do |format|        
        format.js { render partial: 'new' }
      end
    end
    def show
      @service = Service.find(params[:id])
      respond_to do |format|
        # format.html { render(:text => "not implemented") }
        format.js { render partial: 'new' }
      end  
    end
    def create
      @service = Service.new(services_params)
      @service.status = false
      respond_to do |format|
        if (@service.save())
          flash[:success] = 'Servicio creado satisfactoriamente'
          format.html { redirect_to admin_services_path() }
        else
          format.js { render partial: 'new' }
        end
      end
    end
    def update
      @service = Service.find(params[:id])
      respond_to do |format|
        if (@service.update(services_params))        
          flash[:success] = 'Servicio actualizado satisfactoriamente'
          format.html { redirect_to admin_services_path() }
        else
          format.js { render partial: 'new' }
        end 
      end
    end
    def destroy
      @service = Service.find(params[:id])
      @service.destroy()
      respond_to do |format|
        format.js
      end
    end
    def delete_service
      @service = Service.find(params[:id])
      respond_to do |format|
        format.js { render partial: 'delete' }
      end
    end
    def service_stages
      @service = Service.find(params[:id])
      @stage = @service.stages.build
      respond_to do |format|
        # format.html { render(:text => "not implemented") }
        format.js { render partial: 'index_stages' }
      end 
    end 
    def services_params
      params.require(:service).permit(:name, :description, :amount, :status)
    end
  end
end
