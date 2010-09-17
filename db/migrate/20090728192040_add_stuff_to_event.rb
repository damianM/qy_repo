class AddStuffToEvent < ActiveRecord::Migration
  def self.up
    remove_column :events, :event_date
    add_column :events,:event_start, :date
    add_column :events,:event_end, :date
    add_column :events,:place, :string
    add_column :events,:organiser_name, :string
    add_column :events,:organiser_address, :string
    add_column :events,:organiser_www, :string
    add_column :events,:category, :string

  end

  def self.down

    _column :events,:event_start
    remove_column :events,:event_end
    remove_column :events,:place
    remove_column :events,:organiser_name
    remove_column :events,:organiser_address
    remove_column :events,:organiser_www
    remove_column :events,:category
    add_column :events, :event_date, :date
  end
end
