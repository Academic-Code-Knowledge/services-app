module Admin
    class OperationController < AdminController
        def index
            @operations = Operation.all
        end    
    end
end
