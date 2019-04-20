class BlogsController < ApplicationController
  def new
    @current_user == current_user
    if @current_user == nil
      redirect_to new_user_path
    elsif 
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if params[:back]
      render "new"
    elsif
      @blog.save
      flash[:notice]= "写真を投稿しました！！"
      redirect_to blogs_path
    else
      render "new"
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def index
    @blogs = Blog.all
  end
  
  def like
    @favorites = Favorite.all
    @user = current_user
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice]= "写真を削除しました！！"
    redirect_to blogs_path
  end
  
  def update
    @blog = Blog.find(params[:id])
    if params[:back]
      @blog.remove_image!
      render "edit"
    elsif @blog.update(blog_params)
      flash[:notice]= "写真を編集しました！！"
      redirect_to blogs_path
    else
      render "edit"
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.user == nil
      redirect_to new_user_path
    else
    render "new" if @blog.invalid?
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title,:content,:image,:image_cache)
  end
end
