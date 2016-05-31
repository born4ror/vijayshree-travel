class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blogs = current_user.blog
    respond_with(@blogs)
  end

  def list
    @blogs = Blog.where(:publish => true)
  end

  def show
    respond_with(@blog)
  end

  def new
    @blog = current_user.build_blog
    respond_with(@blog)
  end

  def edit
  end

  def create
    @blog = current_user.build_blog(blog_params)
    @blog.save
    redirect_to root_url
  end

  def update
    @blog.update(blog_params)
    respond_with(@blog)
  end

  def destroy
    @blog.destroy
    respond_with(@blog)
  end

  def ajax_update
    @blog = set_blog
    @blog.update(:style => params[:style])
    redirect_to root_url
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :avatar)
    end
end
