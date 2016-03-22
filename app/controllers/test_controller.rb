class TestController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to request.env['omniauth.origin'] || root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def index
    if current_user
      client = Restforce.new :oauth_token => current_user.oauth_token,
        :refresh_token => current_user.refresh_token,
        :instance_url  => current_user.instance_url

  #        :client_id     => Rails.application.config.salesforce_app_id,
  #        :client_secret => Rails.application.config.salesforce_app_secret

      accounts = client.query("select Id, Name from Account")
      @account = accounts.first
    end
  end
end
