class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies, :options => 'default charset=utf8' do |t|
      t.string :name, :limit => 32
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
