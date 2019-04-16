class AddUsernameToVolunteers < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :username, :string
  end
end
