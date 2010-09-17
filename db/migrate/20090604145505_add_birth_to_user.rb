class AddBirthToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :birth, :date
  end

  def self.down
    remove_column :users, :birth
  end
end
