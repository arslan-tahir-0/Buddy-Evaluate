# frozen_string_literal: true

# Blog App
class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  scope :on_pending, -> { where(status: 'Pending') }
  enum status: %i[Pending Accepted Rejected]
  validates :suggestion_content, presence: true, length: { in: 5..100 }
  has_many :replies, as: :replyable, dependent: :destroy
end
