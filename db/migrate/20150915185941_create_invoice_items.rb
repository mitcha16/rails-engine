class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :item_id
      t.integer :invoice_id
      t.string :quantity
      t.string :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
