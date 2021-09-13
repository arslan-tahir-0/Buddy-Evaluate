# frozen_string_literal: true

# It will show all recent posts accordingly
class Reply < ApplicationRecord
  belongs_to :replyable, polymorphic: true
  belongs_to :user
  validates_presence_of :content
end
