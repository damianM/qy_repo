class CreateWhatNews < ActiveRecord::Migration
  def self.up
    create_table :what_news do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :what_news
  end
end
