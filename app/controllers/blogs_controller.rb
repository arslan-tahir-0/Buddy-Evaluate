# frozen_string_literal: true

# This class will handle all blogs functionality
class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    if current_user.Moderator?
      fetch_reports_to_moderator
    else
      @blogs = Blog.is_publish.page(params[:page]).per(7)
    end
  end

  def new
    @blog = Blog.new
    authorize @blog
    # render json: @blogs
  end

  def update
    if params.key?(:status)
      @blog.update(status: params[:status])
      redirect_to root_path, notice: "Blog #{params[:status]} approved Successfully"
    else
      @blog.update(permit_params)
    end
  end

  def create
    @blogs = current_user.blogs.new(permit_params)
    if @blogs.save
      flash[:notice] = 'Blog sent to Moderator for Approval successfully'
    else
      flash[:alert] =  'Blog Parameters not accurate'
    end
    redirect_to blogs_path
  end

  def show
    @author = @blog.user
    @suggestions = @blog.suggestions.on_pending.page(params[:page]).per(3)
    @comments = Comment.includes(:replies).page(params[:page]).per(3)
  end

  def destroy
    return unless @blog.destroy

    redirect_to @blog, notice: 'Blog Deleted Successfully'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def fetch_reports_to_moderator
    @blogs = params.key?(:report) ? Blog.is_reported : Blog.on_pending.page(params[:page]).per(7)
  end

  def permit_params
    params.require(:blog).permit(:heading, :content)
  end
end
