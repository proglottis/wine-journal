class Rank < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
  has_many :wines, through: :ratings

  validates_presence_of :name, :value
end
