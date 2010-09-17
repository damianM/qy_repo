class AddThumbToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :thumb, :string
  end

  def self.down
    remove_column :galleries, :thumb
  end
end
