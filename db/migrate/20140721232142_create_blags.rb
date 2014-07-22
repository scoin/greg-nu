class CreateBlags < ActiveRecord::Migration
  def change
    create_table :blags do |t|
    	t.string :title
    	t.text :content
    	t.string :slug
    	t.references :user
      t.timestamps
    end
    add_index(:blags, :slug)
  end
end
