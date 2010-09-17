class AddIdToEfile < ActiveRecord::Migration
  def self.up
    add_column :efiles,:event_id,:integer
  end

  def self.down
    remove_column :efiles,:event_id
  end
end
