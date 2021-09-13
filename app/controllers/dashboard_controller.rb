# frozen_string_literal: true

# It will show all recent posts accordingly
class DashboardController < ApplicationController
  def index
    # default it will show blogs latest
    if params.key?(:comment)
      @comment = Comment.order('created_at DESC').limit(5)
      route_to('comment')
    elsif params.key?(:likes)
      @likes = ActsAsVotable::Vote.all.limit(7)
      route_to('like')
    else
      @blog = Blog.order('created_at DESC').is_publish.limit(5)
      route_to('blog')
    end
    authorize(:dashboard, :index?)
  end
end
