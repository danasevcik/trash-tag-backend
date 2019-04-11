class ChangeDataTypeInProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :time, :string
  end
end
