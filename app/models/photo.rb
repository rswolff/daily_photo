class Photo < ActiveRecord::Base
  attr_accessible :date_taken, :title, :image
  has_attached_file :image

  def self.current
  	order("created_at DESC").limit(1)
  end
end
