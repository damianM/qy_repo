class RebuildAds < ActiveRecord::Migration
  def self.up
    drop_table :ads
    
    create_table :ads do |t|
      t.integer :user_id

      t.string :type
      t.string :category
      t.string :condition
      t.string :price
      t.string :seller

      t.string :company
      t.string :capacity
      t.string :year
      t.string :mileage
      t.string :kind
      t.string :price
      t.string :title
      t.string :email
      t.string :phone

      t.text :description
      
      t.timestamps
    end  
  end
  
  def self.down
    drop_table :ads
    
    create_table :ads do |t|
      t.string :type
      t.string :category
      t.string :condition
      t.string :price
      t.string :seller
      t.string :capacity
      t.string :year
      t.string :mileage
      t.string :kind
      t.string :price
      t.string :title
      t.string :email
      t.string :phone
      
      t.text :descriptaion
      
      t.timestamps
    end
    
  end
  
end
