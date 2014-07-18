class AdminController < ApplicationController
  before_action :authorize_admin


  private

  def authorize_admin
    unless @current_user.is_admin?
      flash[:error] = "You are not authorized to view this page!"
      redirect_to patients_path and return
    end
  end
end