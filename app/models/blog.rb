# frozen_string_literal: true

# It will show all recent posts accordingly
class Blog < ApplicationRecord
  scope :on_pending, -> { where(status: 'Pending') }
  scope :is_publish, -> { where(status: 'Publish') }
  scope :is_reported, -> { includes(:reports).select { |a| a.reports.count.positive? } }

  enum status: [ :Pending, :Publish, :Unpublish ]
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy
  acts_as_votable
  # validation
  validates :heading, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { in: 1..1500 }
end
