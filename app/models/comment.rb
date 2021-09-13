# frozen_string_literal: true

# It will show all recent posts accordingly
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :reports, as: :reportable, dependent: :destroy
  has_many :replies, as: :replyable, dependent: :destroy
  has_many_attached :images
  validates :content, presence: true, length: { in: 1..1500 }
  acts_as_votable
  # has_many :likes, :as => :likeable
end
