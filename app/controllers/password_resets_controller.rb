class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email to user with instructions for resetting password
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    redirect_to root_url, :notice => "if an account with that email was found, we have sent a link to reset your password ."
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_url, :alert => "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")

    if @user.update(password_params)
      redirect_to sign_in_path, :notice => "Your password has been reset. Please sign in."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
