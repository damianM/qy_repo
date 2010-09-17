class AddReadToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :read, :integer
  end

  def self.down
    remove_column :messages, :read
  end
end
