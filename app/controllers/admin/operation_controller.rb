class Admin::OperationController < ApplicationController
    def index
        @operations = Operation.all
    end
    
end
