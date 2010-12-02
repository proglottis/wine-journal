class Rating < ActiveRecord::Base
  has_one :wine
  has_many :user_ratings
  has_many :users, :through => :user_ratings
end
