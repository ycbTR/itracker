class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :set_current_user

  def index

  end

  def set_current_user
    @current_user = current_user
    User.current = @current_user
  end

end
