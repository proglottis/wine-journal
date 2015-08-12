class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  has_many :user_ratings
  has_many :ratings, :through => :user_ratings
end
