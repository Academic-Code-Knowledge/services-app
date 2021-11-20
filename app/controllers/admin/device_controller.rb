class Admin::DeviceController < ApplicationController
  def index
    # @devices = Device.find(:all)
    @devices = Device.all
  end


end

  