class CreateStretches < ActiveRecord::Migration[7.2]
  def change
    create_table :stretches do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image_path, null: false 
      t.integer :target_area, null: false
      t.text :steps, null: false

      t.timestamps 
    end
  end
end
