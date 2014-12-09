class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.string :weblink
      t.date :start_at
      t.date :end_at
      t.timestamps
    end
    add_column :events, :project_id, :integer
    create_table :projects_residencies, id: false do |t|
      t.references :project, :residency
    end
  end
end
