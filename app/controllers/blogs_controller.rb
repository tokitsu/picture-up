class BlogsController < ApplicationController
    def new
        @blog = Blog.new
    end
    
    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to blogs_path
        else
            render "new"
        end
    end
    
    def index
        @blogs = Blog.all
    end
    
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path
    end
    
    def update
        @blog = Blog.find(params[:id])
        @blog.save
        redirect_to blogs_path
    end
    
    private
    
    def blog_params
        params.require(:blog).permit(:title,:content,:image,:image_cache)
    end
end
