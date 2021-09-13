# frozen_string_literal: true

# It will control Replies for two models (Comment and Suggestion)
class RepliesController < ApplicationController
  before_action :assign_model_kind, only: :create
  def create
    @reply = @reply_model.replies.new(permit_params)
    @reply.user_id = current_user.id
    if !@reply.save
      flash[:alert] = 'Failed to Add your reply'
      redirect_back fallback_location: @reply_model
    end


  end

  private

  def permit_params
    params.require(:replies).permit(:content)
  end
end
