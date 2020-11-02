class SessionsController < ApplicationController

  def new

  end

  def create
    user= User.find_by(user_email: params[:session][:email].downcase)

  end

  def destroy

  end

end