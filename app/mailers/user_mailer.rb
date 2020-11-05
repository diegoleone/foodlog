class UserMailer < ApplicationMailer

  def registration_confirmation
    @user = params[:user]
    @url  = 'http://localhost:3000/login'
    mail(to: @user.user_email, subject: 'Welcome to Foodlog!')
  end
end
