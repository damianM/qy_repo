class AddCounterToVideo < ActiveRecord::Migration
    def self.up
    add_column :videos, :counter, :integer
  end

  def self.down
    remove_column :videos, :counter
  end
end
