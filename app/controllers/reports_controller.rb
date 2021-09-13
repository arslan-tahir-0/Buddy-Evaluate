# frozen_string_literal: true

# This class will handle reports for Post and Comments
class ReportsController < ApplicationController
  before_action :assign_model, only: :create
  def create
    @poly_model = @poly_model.reports.new(permit_params)
    @poly_model.user_id = current_user.id
    flash[:notice] = @poly_model.save ? 'Report Successfully Registered' : 'Report could not be created'
    redirect_back fallback_location: @poly_model
  end

  private

  def permit_params
    params.require(:report).permit(:content)
  end
end
