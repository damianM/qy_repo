class AddStateIdToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :state_id, :integer
    add_column :ads, :company_id, :integer

    remove_column :ads, :company
  end

  def self.down
    remove_column :ads, :state_id
    remove_column :ads, :company_id

    add_column :ads, :company
  end
end
