class CreateVrates < ActiveRecord::Migration
  def self.up
    create_table :vrates do |t|
      t.integer :video_id
      t.integer :sum
      t.integer :votes

      t.timestamps
    end
  end

  def self.down
    drop_table :vrates
  end
end
