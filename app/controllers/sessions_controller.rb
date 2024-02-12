class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user
    # Log the user in and redirect to the user's show page
    else
      # Create an error message.
      flash.now[:warning] = 'Invalid email/password combination'
      render 'new'
  end
end

  def destroy
  end
end 