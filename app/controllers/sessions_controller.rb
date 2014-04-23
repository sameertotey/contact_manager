class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = user
    redirect_to root_path, notice: "Logged in as #{user.name}"
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: "Logged out"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
