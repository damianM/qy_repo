class AddRelationTimestampToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :relationdate, :date
  end

  def self.down
    remove_column :events, :relationdate
  end
end
