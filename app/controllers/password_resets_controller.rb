class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email to user with instructions for resetting password
      PasswordMailer.with(user: @user).reset.deliver_later
    else
      redirect_to root_url, :notice => "if an account with that email was found, we have sent a link to reset your password ."
    end
  end
end
