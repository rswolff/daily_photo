class Photo < ActiveRecord::Base
  attr_accessible :date_taken, :title, :image
  has_attached_file :image

  default_scope order("created_at DESC")

  def self.current
  	order("created_at DESC").limit(1)
  end


end
