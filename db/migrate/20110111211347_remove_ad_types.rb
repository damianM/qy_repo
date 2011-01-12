class RemoveAdTypes < ActiveRecord::Migration
  def self.up
    drop_table :ad_types
  end
  
  def self.down
    create_table :ad_types do |t|
      t.string :name
      t.string :label
      
      t.timestamps
    end
  end
end
