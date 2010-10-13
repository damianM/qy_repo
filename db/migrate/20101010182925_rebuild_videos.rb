class RebuildVideos < ActiveRecord::Migration
  def self.up
    drop_table :videos

    create_table :videos do |t|
      t.integer :gallery_id
      t.string  :content_type
      t.integer :size
      t.string  :filename
      t.string  :title
      t.string  :description
      t.string  :state
      t.integer :counter, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
    
    create_table :videos do |t|
      t.timestamps
    end
  end

end
