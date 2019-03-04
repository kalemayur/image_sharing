class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.string :owner
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end