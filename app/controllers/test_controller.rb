class TestController < ApplicationController
  def index
    @result = nil
    if user_signed_in?
      @client = Restforce.new :oauth_token => current_user.oauth_token,
        :refresh_token => current_user.refresh_token,
        :instance_url  => current_user.instance_url,
        :client_id      => '3MVG9ZL0ppGP5UrBk4PFzk_tZlFHJko5GajvKj7neiN_PY3U1I7DeRzHwGISipPMV4ZVtho227mR80ONjrKbo',
        :client_secret  => '1838435099939267213',
        :authentication_callback => Proc.new {|x| Rails.logger.debug x.to_s},
        :api_version   => '36.0'

  #        :client_id     => Rails.application.config.salesforce_app_id,
  #        :client_secret => Rails.application.config.salesforce_app_secret

#      accounts = client.query("select Id, Name from Account")
#      @account = accounts.first
    end
  end

  def info
    if user_signed_in?
      client = Restforce.new :oauth_token => current_user.oauth_token,
        :refresh_token => current_user.refresh_token,
        :instance_url  => current_user.instance_url,
        :client_id      => '3MVG9ZL0ppGP5UrBk4PFzk_tZlFHJko5GajvKj7neiN_PY3U1I7DeRzHwGISipPMV4ZVtho227mR80ONjrKbo',
        :client_secret  => '1838435099939267213',
        :authentication_callback => Proc.new {|x| Rails.logger.debug x.to_s},
        :api_version   => '36.0'

      @results = client.user_info
    end
  end

  def query
    if params[:q]

      if user_signed_in?
=begin
        client = Restforce.new :oauth_token => current_user.oauth_token,
          :refresh_token => current_user.refresh_token,
          :instance_url  => current_user.instance_url,
          :api_version   => '36.0'
=end
        client = Restforce.new :oauth_token => current_user.oauth_token,
          :refresh_token => current_user.refresh_token,
          :instance_url  => current_user.instance_url,
          :client_id      => '3MVG9ZL0ppGP5UrBk4PFzk_tZlFHJko5GajvKj7neiN_PY3U1I7DeRzHwGISipPMV4ZVtho227mR80ONjrKbo',
          :client_secret  => '1838435099939267213',
          :authentication_callback => Proc.new {|x| Rails.logger.debug x.to_s},
          :api_version   => '36.0'

        begin
          @results = client.query(params[:q])
        rescue
          @results = "err"
        end

      end

    else
      redirect_to root_url
    end
  end
end
