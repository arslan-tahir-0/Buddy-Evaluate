# frozen_string_literal: true

# Module of Blog app
module ApplicationHelper
  def report_button(user)
    return unless user.User?

    "<button id='report-form-show' class='btn btn-danger mr-2'>Report</button>"
  end
end
