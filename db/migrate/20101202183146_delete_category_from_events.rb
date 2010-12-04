class DeleteCategoryFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :category
  end

  def self.down
    add_column :events, :category, :string
  end
end
