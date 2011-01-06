class AddStateIdToStoresTable < ActiveRecord::Migration
  def self.up
    add_column :stores, :state_id, :integer
  end

  def self.down
    remove_column :stores, :state_id
  end
end
