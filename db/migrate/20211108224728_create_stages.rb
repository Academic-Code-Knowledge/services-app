class CreateStages < ActiveRecord::Migration[6.1]
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :time
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
