class AddImageColorToUserPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :user_photos, :image_color, :string
  end
end
