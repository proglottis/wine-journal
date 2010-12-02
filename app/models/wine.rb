class Wine < ActiveRecord::Base
  has_many :ratings

  validates_presence_of :slug, :name
end
