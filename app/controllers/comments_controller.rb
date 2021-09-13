# frozen_string_literal: true

# It will control Replies for two models (Comment and Suggestion)
class CommentsController < ApplicationController
  def index
    render plain: 'Comment index'
  end

  def new
    @comment = Comment.new
    # render json: @blogs
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(permit_params)
    @comment[:user_id] = current_user.id
    @comment.save ? flash[:success] = 'Comment posted.' : flash[:error] = 'Comment could not be posted'
  end

  private

  def permit_params
    params.require(:comment).permit(:content, images: [])
  end
end
