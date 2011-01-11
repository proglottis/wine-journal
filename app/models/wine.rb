class Wine < ActiveRecord::Base
  has_many :ratings

  validates_presence_of :name

  acts_as_taggable_on :grapes
end
