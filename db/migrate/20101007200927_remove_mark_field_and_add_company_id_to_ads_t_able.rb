class RemoveMarkFieldAndAddCompanyIdToAdsTAble < ActiveRecord::Migration
  def self.up
    remove_column :ads, :mark
    add_column :ads, :company_id, :integer
  end

  def self.down
    add_column :ads, :mark, :string
    remove_column :ads, :company_id
  end
end
