class CreateFposts < ActiveRecord::Migration
  def self.up
    create_table :fposts do |t|
      t.integer :topic_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :fposts
  end
end
