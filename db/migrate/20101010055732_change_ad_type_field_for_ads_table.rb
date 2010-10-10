class ChangeAdTypeFieldForAdsTable < ActiveRecord::Migration
  def self.up
    remove_column :ads, :ad_type
    add_column :ads, :ad_type_id, :integer
  end

  def self.down
    add_column :ads, :ad_type, :string
    remove_column :ads, :ad_type_id
  end
end
