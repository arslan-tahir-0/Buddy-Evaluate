# frozen_string_literal: true

# Report Model
class Report < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  validates :content, presence: true, length: { in: 5..100 }
  belongs_to :user
end
