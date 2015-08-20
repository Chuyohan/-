class AddTitleCountToBorders < ActiveRecord::Migration
  def change
    add_column :borders, :title, :text
    add_column :borders, :count, :integer
  end
end
