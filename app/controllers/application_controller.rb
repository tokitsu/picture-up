class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authenticate_user,{only: [:edit, :update]}
  
  def authenticate_user
    if @current_user == nil
      redirect_to new_user_path
    end
  end
end
