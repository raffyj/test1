class SessionsController < ApplicationController

  def new
    @titile = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
	  params[:session][:password])
	if user.nil?
	  flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
	  render 'new'
	else
	  sign_in user
	  redirect_to user
	end
  end
  
  def destry
  
  end
  
end
