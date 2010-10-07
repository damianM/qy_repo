class RemoveRates < ActiveRecord::Migration
  def self.up
    drop_table :uservrates
    drop_table :userprates

    drop_table :vrates
    drop_table :prates
  end

  def self.down
    create_table :prates do |t|
      t.integer :photo_id
      t.integer :sum
      t.integer :votes

      t.timestamps
    end

    create_table :vrates do |t|
      t.integer :vhoto_id
      t.integer :sum
      t.integer :votes

      t.timestamps
    end

    create_table :userprates do |t|
      t.integer :user_id
      t.integer :prate_id

      t.timestamps
    end

    create_table :uservrates do |t|
      t.integer :user_id
      t.integer :vrate_id

      t.timestamps
    end

  end
end
