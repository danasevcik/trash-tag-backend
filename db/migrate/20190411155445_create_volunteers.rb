class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
