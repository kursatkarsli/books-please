class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(4)
  end
end
