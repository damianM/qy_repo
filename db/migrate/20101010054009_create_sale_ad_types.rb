class CreateSaleAdTypes < ActiveRecord::Migration
  def self.up
    create_table :sale_ad_types do |t|
      t.string :label
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :sale_ad_types
  end
end
