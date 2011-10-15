class Rank < ActiveRecord::Base
  has_many :ratings
  has_many :wines, :through => :ratings, :uniq => true

  validates_presence_of :name, :value
end
