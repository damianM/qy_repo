class RebuildUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_request_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_ip
    remove_column :users, :last_login_ip

    add_column    :users,  :password_salt, :string
  end

  def self.down
    add_column :users, :login_count,        :integer,   :default => 0
    add_column :users, :failed_login_count, :integer,   :default => 0
    add_column :users, :last_request_at,    :datetime
    add_column :users, :current_login_at,   :datetime
    add_column :users, :last_login_at,      :datetime
    add_column :users, :current_login_ip,   :string
    add_column :users, :last_login_ip,      :string

    remove_column :users, :password_salt
  end
end
