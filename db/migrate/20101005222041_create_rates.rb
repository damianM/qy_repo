class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.integer :rateatable_id
      t.string  :rateatable_type
      t.integer :user_id
      t.integer :value, :limit => 16

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
