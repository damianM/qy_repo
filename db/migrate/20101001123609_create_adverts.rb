class CreateAdverts < ActiveRecord::Migration
  def self.up
    create_table :adverts do |t|
      t.string :section_name

      t.timestamps
    end
  end

  def self.down
    drop_table :adverts
  end
end
