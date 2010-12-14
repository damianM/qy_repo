class RebuildThumbnails < ActiveRecord::Migration
  def self.up
    add_column :thumbnails, :thumbnailable_id, :integer
    add_column :thumbnails, :thumbnailable_type, :string, :limit => 128

    add_column :thumbnails, :type, :string, :limit => 128
    add_column :thumbnails, :width, :integer
    add_column :thumbnails, :height, :integer

    remove_column :videos, :thumbnail_id
  end

  def self.down
    add_column :videos, :thumbnail_id, :integer

    remove_column :thumbnails, :thumbnailable_id
    remove_column :thumbnails, :thumbnailable_type
    
    remove_column :thumbnails, :type
    remove_column :thumbnails, :width
    remove_column :thumbnails, :height
  end
end
