class AddClubContentsToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :picture, :string
    add_column :clubs, :intro, :text
    add_column :clubs, :location, :string
    add_column :clubs, :personnel, :string
    add_column :clubs, :history, :text
    add_column :clubs, :phone, :string
  end
end
