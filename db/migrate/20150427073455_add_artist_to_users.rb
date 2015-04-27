class AddArtistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artist_id, :integer
    add_column :posts, :blog, :boolean, default: false, null: false
  end
end
