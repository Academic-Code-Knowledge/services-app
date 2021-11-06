class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[landing]
  def index
  end
  def landing
  end
end
