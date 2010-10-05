class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :type
      t.boolean :web_store, :default => false
      t.string :name
      t.string :street
      t.string :city
      t.string :phone
      t.string :email
      t.string :www

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
