class AddViewsToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :views, :integer
  end

  def self.down
    remove_column :videos, :views
  end
end
