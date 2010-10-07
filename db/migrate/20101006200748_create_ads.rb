class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :ad_type
      t.string :mark
      t.string :quad_type
      t.string :capacity
      t.string :year
      t.string :mileage
      t.string :kind
      t.string :price
      t.string :sale_person
      t.string :title
      t.text :description
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
