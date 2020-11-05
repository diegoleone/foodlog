class SessionsController < ApplicationController

  def new

  end

  def create
    user= User.find_by(user_email: params[:session][:user_email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        redirect_to user
      else
        flash.now[:alert] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash.now[:alert] = "There was something wrong with your log in details"
      render 'new'
    end
  end

  def destroy
    session[:user_id]= nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end