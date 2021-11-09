module Admin
  class OperationController < AdminController
    before_action :authenticate_user!

    def index
      @operations = Operation.all
    end

    def procesar
    end
  end
end
