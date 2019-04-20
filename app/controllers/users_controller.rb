class UsersController < ApplicationController
  def top
    end

  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice]= "ログインしました！"
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end
    
  def show
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    @current_user == current_user
    if @current_user == nil
      redirect_to new_session_path
    elsif @user != @current_user
      redirect_to user_path(@current_user.id)
    elsif @user.update(user_params)
      session[:user_id] = @user.id
      flash[:notice]= "登録内容を変更しました！"
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end
    
  def edit
    @user = User.find(params[:id])
  end
    
  private
    
  def user_params
    params.require(:user).permit(:name,:email,:password,
    :password_confirmation,:image)
  end
end