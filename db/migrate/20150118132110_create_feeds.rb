class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :item, polymorphic: true, index: true
      t.text :content
      t.datetime :timestamp
      t.boolean :hidden
      t.string :link_url
      t.string :source
      t.string :title
      t.integer :twitter_id, limit: 8
      t.timestamps
    end
  end
end
