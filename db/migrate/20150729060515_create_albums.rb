class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :club_id
      t.string :image

      t.timestamps null: false
    end
  end
end
