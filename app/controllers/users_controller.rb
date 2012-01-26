class UsersController < ApplicationController
  def new
    @title = "SIGN UP"
  end
  
  def show
    @user = User.find(params[:id])
  end
end
