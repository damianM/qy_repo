class CreatePcomments < ActiveRecord::Migration
  def self.up
    create_table :pcomments do |t|
      t.integer :photo_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :pcomments
  end
end
