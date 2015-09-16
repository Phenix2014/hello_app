class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #user login and redirect to user page
      log_in user
      redirect_to user
    else
      # generate an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  
  def destroy
    log_out
    redirect_to root_url
  end
end
