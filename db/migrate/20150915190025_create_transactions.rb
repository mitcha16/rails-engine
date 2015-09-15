class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
