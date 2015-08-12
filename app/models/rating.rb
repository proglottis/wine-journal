class Rating < ActiveRecord::Base
  belongs_to :wine
  belongs_to :rank
  has_many :user_ratings, dependent: :destroy
  has_many :users, :through => :user_ratings

  validates_presence_of :wine_id, :rank_id
end
