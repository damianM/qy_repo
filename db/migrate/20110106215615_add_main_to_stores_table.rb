class AddMainToStoresTable < ActiveRecord::Migration
  def self.up
    add_column :stores, :main, :boolean, :default => false
  end

  def self.down
    remove_column :stores, :main, :boolean
  end
end
