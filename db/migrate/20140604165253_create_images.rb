class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.string :image_content_type
      t.string :caption
      t.string :credit
      t.integer :item_id
      t.string :item_type

      t.timestamps
    end
      add_index :images, [:item_type, :item_id]
  end
end
