class AddCostColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :cost, :decimal
  end
end
