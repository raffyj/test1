class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end
  
  def new
    @user = User.new
    @title = "SIGN UP"
  end 

  def create
      # raise params[:user].inspect
      @user = User.new(params[:user])
	  if @user.save
	    # handle a successful save
		
	  else
	    @title = "SIGN UP"
        render 'new'
	  end
	end
  
  
end
