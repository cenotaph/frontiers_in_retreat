class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :city
      t.string :country
      t.float :latitude, :limit => 10
      t.float :longitude, :limit => 10
      t.text :description
      t.boolean :current
      t.timestamps
    end
  end
end
