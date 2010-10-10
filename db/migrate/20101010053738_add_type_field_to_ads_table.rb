class AddTypeFieldToAdsTable < ActiveRecord::Migration
  def self.up
    add_column :ads, :type, :string
  end

  def self.down
    remove_column :ads, :type
  end
end
