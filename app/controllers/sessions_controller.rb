class SessionsController < ApplicationController
  def new
  end

  def create
    remember = params[:sessions][:remember_me]

    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      params[:sessions][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
