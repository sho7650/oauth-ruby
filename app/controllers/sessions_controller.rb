class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to request.env['omniauth.origin'] || root_url, notice: "#{user.id}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "signout"
  end
end
