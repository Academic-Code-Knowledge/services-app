class CamController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def save
    params.permit!
    data = params[:image]
    filename = params[:name]
    image = data.split (",")
    File.open("capturas/" + filename + ".png", "wb") do |file|
      file.write(Base64.decode64(image[1]))
    end
  end
end
