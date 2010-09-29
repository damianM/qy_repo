class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states, :options => 'default charset=utf8' do |t|
      t.string :name, :limit => 32
      t.timestamps
    end
  end

  def self.down
    drop_table :states
  end
end
