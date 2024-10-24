class AddVideoToPetProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :pet_projects, :video, :string
  end
end
