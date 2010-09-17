class CreateMessageDetails < ActiveRecord::Migration
  def self.up
    create_table :message_details do |t|
      t.integer :message_id
      t.integer :details

      t.timestamps
    end
  end

  def self.down
    drop_table :message_details
  end
end
