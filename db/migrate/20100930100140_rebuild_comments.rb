class RebuildComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :receiver_id
    remove_column :comments, :sender_id
    
    add_column :comments, :user_id, :integer

    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string, :limit => 128

    drop_table :vcomments
    drop_table :pcomments
  end

  def self.down
    add_column :comments, :receiver_id, :integer
    add_column :comments, :sender_id, :integer

    remove_column :comments, :user_id
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type

    create_table :vcomments do |t|
      t.integer :video_id
      t.integer :user_id
      t.text :content
      
      t.timestamps
    end

    create_table :pcomments do |t|
      t.integer :photo_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end

  end
end
