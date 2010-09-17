class CreateVcomments < ActiveRecord::Migration
  def self.up
    create_table :vcomments do |t|
      t.integer :video_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :vcomments
  end
end
