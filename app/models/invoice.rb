class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer

  def self.success
    joins(:transactions).where("result = 'success'")
  end


  def self.date(params)
    self.find_by_sql("SELECT * FROM invoices WHERE 'created_at' = '#{params[:date]}'")
  end
end
