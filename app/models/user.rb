# frozen_string_literal: true

# It will show all recent posts accordingly
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: %i[User Moderator Admin]
  has_many :blogs
  has_many :comments
  has_many :votes
  has_many :reports
  has_many :replies
  has_many :suggestions
  # has_many :likes
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable
end
