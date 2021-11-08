class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.date :date
      t.float :sub_total
      t.float :tax
      t.float :total
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
