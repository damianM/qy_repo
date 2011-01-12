class RemoveSaleAdType < ActiveRecord::Migration
  def self.up
    drop_table :sale_ad_types
  end

  def self.down
    create_table :sale_ad_types do |t|
      t.string :label
      t.string :name
      t.timestamps
    end
  end

end
