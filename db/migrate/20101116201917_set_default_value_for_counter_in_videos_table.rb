class SetDefaultValueForCounterInVideosTable < ActiveRecord::Migration
  def self.up
    change_column :videos, :counter, :integer, :default => 0
  end

  def self.down
    change_column :videos, :counter, :integer
  end
end
