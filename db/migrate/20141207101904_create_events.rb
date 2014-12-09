class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :site, index: true
      t.datetime :start_at
      t.datetime :end_at
      t.string :name
      t.string :image
      t.integer :image_size, length: 8
      t.integer :image_width
      t.integer :image_height
      t.string :image_content_type
      t.string :facebook_link
      t.text :description
      t.string :external_link
      t.boolean :published
      t.string :slug

      t.timestamps
    end
    create_table :events_residencies, id: false do |t|
      t.references :event, :residency
    end
    add_index :events_residencies, [:event_id, :residency_id]
  end
end
