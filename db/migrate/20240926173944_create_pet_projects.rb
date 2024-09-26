class CreatePetProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_projects do |t|
      t.string :title
      t.text :description
      t.text :images
      t.text :languages
      t.text :libraries
      t.text :resources
      t.string :github
      t.string :hosting
      t.integer :age
      t.boolean :is_game

      t.timestamps
    end
    add_index :pet_projects, :age, unique: true
    add_index :pet_projects, :is_game
  end
end
