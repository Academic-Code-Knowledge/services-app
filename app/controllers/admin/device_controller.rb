class Admin::DeviceController < ApplicationController
  def index
    @devices = Device.find(:all)
  end


end

  