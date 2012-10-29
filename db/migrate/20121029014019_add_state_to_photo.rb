class AddStateToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :state, :string
  end
end
