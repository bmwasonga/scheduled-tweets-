class MainController < ApplicationController
  def index
    flash.now[:notice] = "Logged in successfully"
    flash.now[:alert] = "Wrong credentials"
  end
end # class MainController