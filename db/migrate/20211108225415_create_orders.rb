class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.date :date_in
      t.date :date_out
      t.date :date_real
      t.text :issue_description
      t.string :photo
      t.references :user, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
