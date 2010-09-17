class CreateEfiles < ActiveRecord::Migration
  def self.up
    create_table :efiles do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :efiles
  end
end
