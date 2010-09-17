class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :gallery_id
      t.string :link
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
