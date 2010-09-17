class CreateUservrates < ActiveRecord::Migration
  def self.up
    create_table :uservrates do |t|
      t.integer :user_id
      t.integer :vrate_id

      t.timestamps
    end
  end

  def self.down
    drop_table :uservrates
  end
end
