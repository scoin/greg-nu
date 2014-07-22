class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :title
    	t.string :url
    	t.references :blag
      t.timestamps
    end
  end
end
