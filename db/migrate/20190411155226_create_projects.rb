class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.date :date
      t.time :time
      t.string :story
      t.string :start_image
      t.string :end_image
      t.boolean :completed

      t.timestamps
    end
  end
end
