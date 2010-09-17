class AddCounterToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :counter, :integer
  end

  def self.down
    remove_column :photos, :counter
  end
end
