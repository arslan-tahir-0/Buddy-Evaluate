# frozen_string_literal: true

# This class will handle reports for Post and Comments
class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:update]

  def index
    @suggestions = current_user.suggestions
  end

  def create
    @suggestion = Blog.find(params[:blog_id]).suggestions.new(permit_params)
    @suggestion.user_id = current_user.id
    flash[:notice] = @suggestion.save ? 'Your suggestion is successfully saved' : 'Your suggestion is not saved successfully'
    redirect_to blog_url(params[:blog_id])
  end

  def update
    # Add in rejected state
    flash[:notice] = @suggestion.update(status: params[:update_status].to_i) ? 'Suggestion Rejected Successfully' : 'Error Rejecting this Suggestion'
    redirect_to blog_url(params[:blog_id])
  end

  private

  def permit_params
    params.require(:suggestion).permit(:suggestion_content)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
