class AddSpecialAndDayOfferFieldsToAdsTable < ActiveRecord::Migration
  def self.up
    add_column :ads, :special, :boolean, :default => false
    add_column :ads, :day_offer, :boolean, :default => false
  end

  def self.down
    remove_column :ads, :special
    remove_column :ads, :day_offer    
  end
end
