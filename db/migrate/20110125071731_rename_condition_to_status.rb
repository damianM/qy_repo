class RenameConditionToStatus < ActiveRecord::Migration
  def self.up
    rename_column :ads, :condition, :status
  end

  def self.down
    rename_column :ads, :status, :condition
  end
end
