class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.references :stretch, null: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
