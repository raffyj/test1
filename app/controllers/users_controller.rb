class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end
  
  def new
    @user = User.new
    @title = "SIGN UP"
  end  
  
end
