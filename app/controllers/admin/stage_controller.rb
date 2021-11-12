class Admin::StageController < ApplicationController

  def index
    @stages = Stage.all
  end

  


end
