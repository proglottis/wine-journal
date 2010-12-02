class UserRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :rating

  validates_presence_of :user, :rating
end
