class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update]
  
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
  
  def edit
  
  
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])    
	if @user.update_attributes(params[:user])
	  redirect_to @user, :flash => { :success => "Profile updated." }
	else
	  @title = "Edit user"
      render 'edit'
	end
  end
  
  private
  
  def authenticate
    # flash[:notice] = "please sign in to access this page."
    deny_acess unless signed_in?
  end
  
end
