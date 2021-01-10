class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :tags, array: true, default: []
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
