# frozen_string_literal: true

# This controller will handle Likes for Post and Comment
class LikesController < ApplicationController
  before_action :assign_model, only: [:update]
  def update
    if current_user.voted_up_on? @poly_model
      @poly_model.unliked_by current_user
    else
      @poly_model.liked_by current_user
    end
  end
end
