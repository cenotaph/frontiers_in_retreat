class CreateResidencies < ActiveRecord::Migration
  def change
    create_table :residencies do |t|
      t.references :artist, index: true, null: false
      t.references :site, index: true, null: false
      t.date :start_at
      t.date :end_at
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
