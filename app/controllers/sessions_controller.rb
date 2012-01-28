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
	  # Handle successful signin.
	end
  end
  
  def destry
  
  end
  
end
