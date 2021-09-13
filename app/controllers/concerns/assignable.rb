# frozen_string_literal: true

# It assigns the specific model reference by polymorphic model ids coming
module Assignable
  extend ActiveSupport::Concern
  def assign_model
    if params.key?(:comment_id)
      @poly_model = Comment.find(params[:comment_id])
      @type = 'Comment'
    elsif params.key?(:blog_id)
      @poly_model = Blog.find(params[:blog_id])
      @type = 'Blog'
    end
  end

  def assign_model_kind
    if params.key?(:comment_id)
      @reply_model = Comment.find(params[:comment_id])
    elsif params.key?(:suggestion_id)
      # Suggestion id will be here
      @reply_model = Suggestion.find(params[:suggestion_id])
    end
  end

  def route_to(required_format)
    respond_to do |format|
      format.html { render "#{required_format}_view.html.erb" }
    end
  end
end
