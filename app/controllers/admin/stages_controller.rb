module Admin
  class StagesController < AdminController
    before_action :set_service
    def index
    end
    def create
      @stage = @service.stages.build(stage_params)
      respond_to do |format|        
        if @stage.save
          format.js { render partial: 'admin/services/index_stages' }
        else
          render action: 'new'
        end
      end      
    end

    private
      def set_service
        @service = Service.find(20)
      end
      def stage_params
        params.require(:stage).permit(:name, :time, :service_id)
      end
  end
end
