class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, foreign_key: true
      t.text :description
      t.string :tags, array: true

      t.timestamps
    end
  end
end
