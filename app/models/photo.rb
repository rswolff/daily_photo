class Photo < ActiveRecord::Base
  attr_accessible :date_taken, :title, :image
  has_attached_file :image, :styles => { :medium => "940x940>", :thumb => "120x120>"}

  default_scope order("created_at DESC")

  def self.current
  	order("created_at DESC").limit(1)
  end

  def headline
  	self.created_at.to_s(:med) + " - " + self.title 
  end


end
