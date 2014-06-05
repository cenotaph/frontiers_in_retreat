class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :firstname
      t.string :surname
      t.text :bio
      t.string :website
      t.string :slug
      t.boolean :visible
      t.string :sortname

      t.timestamps
    end
  end
end
