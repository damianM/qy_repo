class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :assetable_id
      t.string  :assetable_type, :limit => 64
      t.integer :parent_id
      t.string  :content_type, :limit => 64
      t.string  :type, :limit => 16
      t.string  :filename
      t.string  :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.string  :serial, :limit => 32

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
