class ChangeCompanyToCompanyIdForQuads < ActiveRecord::Migration
  def self.up
    remove_column :quads, :company
    add_column    :quads, :company_id, :integer
  end

  def self.down
    remove_column :quads, :company_id
    add_column    :quads, :company, :string
  end
end
