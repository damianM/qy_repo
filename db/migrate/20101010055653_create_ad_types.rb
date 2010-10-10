class CreateAdTypes < ActiveRecord::Migration
  def self.up
    create_table :ad_types do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_types
  end
end
