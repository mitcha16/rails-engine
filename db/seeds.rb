require 'csv'
require 'bigdecimal'
class FileReader
  def read(file)
    CSV.open "#{file}", headers: true, header_converters: :symbol
  end
end

class Seed
  def self.start
    get_info
    create_merchants
    create_customers
    create_items
    create_invoices
    create_invoice_items
    create_transactions
  end

  def self.get_info
    reader = FileReader.new
    @merchants      = reader.read("db/data/merchants.csv")
    @customers      = reader.read("db/data/customers.csv")
    @transactions   = reader.read("db/data/transactions.csv")
    @invoices       = reader.read("db/data/invoices.csv")
    @invoice_items  = reader.read("db/data/invoice_items.csv")
    @items          = reader.read("db/data/items.csv")
  end

  def self.create_merchants
    @merchants.each do |line|
      Merchant.create(id: line[:id], name: line[:name],
      created_at: line[:created_at], updated_at: line[:updated_at])
    end
  end

  def self.create_customers
    @customers.each do |line|
      Customer.create(id: line[:id], first_name: line[:first_name],
      created_at: line[:created_at], updated_at: line[:updated_at],
      last_name: line[:last_name])
    end
  end

  def self.create_items
    @items.each do |line|
      Item.create(id: line[:id], name: line[:name],
      created_at: line[:created_at], updated_at: line[:updated_at],
      description: line[:description], unit_price: BigDecimal.new(line[:unit_price].insert(-3, ".")),
      merchant_id: line[:merchant_id] )
    end
  end

  def self.create_invoices
    @invoices.each do |line|
      Invoice.create(id: line[:id], status: line[:status],
      created_at: line[:created_at], updated_at: line[:updated_at],
      customer_id: line[:customer_id],
      merchant_id: line[:merchant_id] )
    end
  end

  def self.create_invoice_items
    @invoice_items.each do |line|
      InvoiceItem.create(id: line[:id], item_id: line[:item_id],
      created_at: line[:created_at], updated_at: line[:updated_at],
      invoice_id: line[:invoice_id], quantity: line[:quantity],
      unit_price: BigDecimal.new(line[:unit_price].insert(-3, ".")) )
    end
  end

  def self.create_transactions
    @transactions.each do |line|
      Transaction.create(id: line[:id], invoice_id: line[:invoice_id],
      created_at: line[:created_at], updated_at: line[:updated_at],
      credit_card_number: line[:credit_card_number],
      result: line[:result] )
    end
  end
end

Seed.start
