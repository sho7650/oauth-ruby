class TestController < ApplicationController
  def index
    if user_signed_in?
      client = Restforce.new :oauth_token => current_user.oauth_token,
        :refresh_token => current_user.refresh_token,
        :instance_url  => current_user.instance_url

  #        :client_id     => Rails.application.config.salesforce_app_id,
  #        :client_secret => Rails.application.config.salesforce_app_secret

#      accounts = client.query("select Id, Name from Account")
#      @account = accounts.first
    end
  end
end
