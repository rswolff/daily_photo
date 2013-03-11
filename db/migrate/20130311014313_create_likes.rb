class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :subscriber_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
