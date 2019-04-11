class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :picture
      t.string :hometown
      t.string :current_city
      t.integer :age
      t.string :bio

      t.timestamps
    end
  end
end
