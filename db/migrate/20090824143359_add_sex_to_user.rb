class AddSexToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :sex, :char
  end

  def self.down
    remove_column :users, :sex
  end
end
