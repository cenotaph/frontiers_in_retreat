class FixFilesize < ActiveRecord::Migration
  def change
    rename_column :sites, :image_file_size, :image_size
  end
end
