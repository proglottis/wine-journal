class Rating < ActiveRecord::Base
  belongs_to :wine
  has_many :user_ratings
  has_many :users, :through => :user_ratings

  validates_presence_of :wine_id, :value
end
