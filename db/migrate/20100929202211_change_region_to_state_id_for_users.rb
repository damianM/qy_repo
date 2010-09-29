class ChangeRegionToStateIdForUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :region
    add_column    :users, :state_id, :integer
  end

  def self.down
    remove_column :users, :state_id
    add_column    :users, :region, :string
  end
end
