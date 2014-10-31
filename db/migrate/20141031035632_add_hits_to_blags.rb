class AddHitsToBlags < ActiveRecord::Migration
  def change
  	add_column :blags, :hits, :integer, default: 0
  end
end
