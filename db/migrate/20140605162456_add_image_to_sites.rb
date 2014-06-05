class AddImageToSites < ActiveRecord::Migration
  def change
    add_column :sites, :image, :string
    add_column :sites, :image_file_size, :integer, :length => 8
    add_column :sites, :image_content_type, :string
    add_column :sites, :image_width, :integer
    add_column :sites, :image_height, :integer
  end
end
