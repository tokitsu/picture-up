class BlogsController < ApplicationController
    def new
        @blog = Blog.new
    end
    
    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if params[:back]
            render "new"
        elsif
            @blog.save
            ContactMailer.contact_mail(@blog).deliver
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
        if  params[:back]
            @blog.remove_image!
            render "edit"
        elsif  @blog.update(blog_params)
            flash[:notice]= "写真を編集しました！！"
            redirect_to blogs_path
        else
            render "edit"
        end
    end
    
    def confirm
        @blog = Blog.new(blog_params)
    end
    
    private
    
    def blog_params
        params.require(:blog).permit(:title,:content,:image,:image_cache)
    end
end
