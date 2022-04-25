class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_account = TwitterAccount.find(params[:id])
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "Twitter account deleted @#{@twitter_account.username}"
  end
end
