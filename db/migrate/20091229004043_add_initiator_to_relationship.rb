class AddInitiatorToRelationship < ActiveRecord::Migration
  def self.up
    add_column :relationships, :initiator_id, :integer
  end

  def self.down
    remove_column :relationships, :initiator_id
  end
end
