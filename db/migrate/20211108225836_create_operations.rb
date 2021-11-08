class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.string :stage_name
      t.integer :estimate_time
      t.date :start_date
      t.date :end_date
      t.string :status
      t.text :issue_description
      t.string :photo_in
      t.string :photo_out
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
