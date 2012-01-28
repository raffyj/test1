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
      # using raise tool
      # raise params[:user].inspect
      @user = User.new(params[:user])
	  if @user.save
	    sign_in @user
	    # handle a successful save
		# flash[:success] = "Welcome to the sample app!"
		redirect_to @user, :flash => { :success => "Welcome to the sample app!" }
	  else
	    @title = "SIGN UP"
        render 'new'
	  end
	end
  
  
end
