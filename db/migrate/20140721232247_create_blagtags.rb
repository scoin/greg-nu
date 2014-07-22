class CreateBlagtags < ActiveRecord::Migration
  def change
    create_table :blagtags do |t|
    	t.references :blag
    	t.references :tag 

      t.timestamps
    end
  end
end
