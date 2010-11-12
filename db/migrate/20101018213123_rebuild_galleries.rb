class RebuildGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :galleriable_id, :integer
    add_column :galleries, :galleriable_type, :string, :limit => 128

    remove_column :galleries, :user_id
    remove_column :galleries, :event_id
  end

  def self.down
    remove_column :galleries, :galleriable_id
    remove_column :galleries, :galleriable_type

    add_column :galleries, :user_id, :integer
    add_column :galleries, :event_id, :integer
  end
end
