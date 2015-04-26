class AddSlugToArtists < ActiveRecord::Migration
  def change
    add_index :artists, :slug, unique: true
    Artist.find_each(&:save)
  end
end
