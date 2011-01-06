class AddLabelToStatesTableAndFillData < ActiveRecord::Migration
  def self.up
    add_column :states, :label, :string
    
    State.all.each do |state|
      state.update_attribute(:label,state.name.to_url_format)
    end
  end

  def self.down
    remove_column :states, :label
  end
end
