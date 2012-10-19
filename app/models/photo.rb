require 'exifr' #TODO - this won't require
class Photo < ActiveRecord::Base
  attr_accessible :date_taken, :title, :image
  has_attached_file :image, :styles => { :medium => "940x940>", :thumb => "120x120>"}

  default_scope order("created_at DESC")

  after_image_post_process :set_exif_data

  def self.current
  	order("created_at DESC").limit(1)
  end

  def headline
  	self.created_at.to_s(:med) + " - " + self.title 
  end

  def camera_brand_model
  	camera_brand + " " + camera_model if camera_brand && cameral_model
  end

	def set_exif_data
		# helpful articles
		# https://github.com/thoughtbot/paperclip/wiki/Extracting-image-dimensions
		# https://groups.google.com/forum/?fromgroups=#!topic/paperclip-plugin/zYXS1GOvaLg
		tempfile = image.queued_for_write[:original].path
		unless tempfile.nil?
			#binding.pry
			puts "Im in"
		  exif = EXIFR::JPEG.new(tempfile)
		  return if exif.nil? or not exif.exif?
		  self.width = exif.width
		  self.height = exif.height
		  self.camera_brand = exif.make
		  self.camera_model = exif.model
		  self.exposure_time = exif.exposure_time.to_s
		  self.f_number = exif.f_number.to_f
		  self.iso_speed_rating = exif.iso_speed_ratings
		  self.focal_length = exif.focal_length.to_f
		  self.date_taken = exif.date_time
		end
	end
end
