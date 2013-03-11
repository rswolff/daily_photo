class Subscriber < ActiveRecord::Base
  attr_accessible :email

  has_many :likes
  has_many :photos, :through => :likes
end
