class CreatePrates < ActiveRecord::Migration
  def self.up
    create_table :prates do |t|
      t.integer :photo_id
      t.integer :sum
      t.integer :votes

      t.timestamps
    end
  end

  def self.down
    drop_table :prates
  end
end
