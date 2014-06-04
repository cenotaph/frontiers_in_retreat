class AddLeadToSites < ActiveRecord::Migration
  def change
    add_column :sites, :lead, :boolean
  end
end
