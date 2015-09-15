class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :unit_price
      t.integer :merchant_id
      t.string :created_at
      t.string :updated_at
    end
  end
end
