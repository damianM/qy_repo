class RebuildPhotos < ActiveRecord::Migration
  def self.up
    drop_table :photos

    create_table :photos, :options => 'default charset=utf8' do |t|
      t.integer :gallery_id
      t.integer :parent_id
      t.string  :content_type, :limit => 64
      t.string  :type, :limit => 16
      t.string  :filename
      t.string  :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.text    :description
      t.integer :counter, :default => 0

      t.timestamps
    end


  end

  def self.down
    drop_table :photos
    
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :link
      t.string :thumb
      t.text :description
      
      t.timestamps
    end
  end
end
