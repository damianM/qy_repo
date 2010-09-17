class CreateUserprates < ActiveRecord::Migration
  def self.up
    create_table :userprates do |t|
      t.integer :user_id
      t.integer :prate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :userprates
  end
end
