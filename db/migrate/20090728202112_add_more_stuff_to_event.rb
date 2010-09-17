class AddMoreStuffToEvent < ActiveRecord::Migration
  def self.up
    add_column :events,:organiser_email, :string
    add_column :events,:organiser_phone, :string
  end

  def self.down
    remove_column :events,:organiser_email
    remove_column :events,:organiser_phone
  end
end
