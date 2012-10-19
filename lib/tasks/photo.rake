require 'exifr'
namespace :photo do
	desc "processes exif information for photos already in the system"
	task :process_all_photos_exif => :environment do
		
		Photo.all.each do |photo|
			exif = EXIFR::JPEG.new(photo.image.path(:original))
			photo.width = exif.width
		  photo.height = exif.height
		  photo.camera_brand = exif.make
		  photo.camera_model = exif.model
		  photo.exposure_time = exif.exposure_time.to_s
		  photo.f_number = exif.f_number.to_f
		  photo.iso_speed_rating = exif.iso_speed_ratings
		  photo.focal_length = exif.focal_length.to_f
		  photo.date_taken = exif.date_time
			photo.save

			puts "Photo #{photo.id} exif information saved."

		end
	end
end