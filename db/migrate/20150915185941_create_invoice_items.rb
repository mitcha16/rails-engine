class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :item_id
      t.integer :invoice_id
      t.float :quantity
      t.float :unit_price
      t.timestamps null: false
    end
  end
end
