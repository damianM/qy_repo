class SetDefaultValueForCounterInPhotosTable < ActiveRecord::Migration
  def self.up
    change_column :photos, :counter, :integer, :default => 0
  end

  def self.down
    change_column :photos, :counter, :integer
  end
end
