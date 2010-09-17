class AddRelationToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :relation, :text
  end

  def self.down
    remove_column :events, :relation
  end
end
