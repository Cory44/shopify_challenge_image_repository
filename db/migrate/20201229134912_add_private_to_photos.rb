class AddPrivateToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :private, :boolean, default: false
  end
end
