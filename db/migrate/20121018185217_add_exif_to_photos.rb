class AddExifToPhotos < ActiveRecord::Migration
  def change
		add_column :photos, :width, :integer
    add_column :photos, :height, :integer
    add_column :photos, :camera_brand, :string
    add_column :photos, :camera_model, :string
    add_column :photos, :exposure_time, :string
    add_column :photos, :f_number, :float
    add_column :photos, :iso_speed_rating, :integer
    add_column :photos, :focal_length, :float
  end
end
