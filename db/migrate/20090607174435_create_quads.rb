class CreateQuads < ActiveRecord::Migration
  def self.up
    create_table :quads do |t|
      t.string :company
      t.string :qtype
      t.text :description
      t.integer :gallery_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quads
  end
end
