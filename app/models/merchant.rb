class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def revenue(params)
    {"revenue"=>"#{calculate_revenue(params)}"}
  end

  def self.most_revenue(params)
    all.max(params[:quantity].to_i) do |merchant1, merchant2|
      merchant1.calculate_revenue(params) <=> merchant2.calculate_revenue(params)
    end
  end

  def self.revenue_by_date(params)
    revenue = Invoice.success.where("invoices.created_at = '#{params[:date]}'").
    joins(:invoice_items).sum(('quantity * unit_price'))

    {total_revenue: "#{revenue}"}
  end

  def self.most_items(params)
    all.max(params[:quantity].to_i) do |merchant1, merchant2|
      merchant1.successful_items.size <=> merchant2.successful_items.size
    end
  end

  def favorite
    Customer.find(invoice_customer)
  end

  def invoice_customer
    invoices.success.joins(:customer).group(:customer_id).
    count.sort_by {|key, value| [value, key]}.reverse.first.first
  end

  def successful_items
    invoices.success.joins(:invoice_items)
  end

  def calculate_revenue(params)
    if params[:date]
      invoices.success.where("invoices.created_at = '#{params[:date]}'").
      joins(:invoice_items).sum(('quantity * unit_price'))
    else
      invoices.success.joins(:invoice_items).sum('quantity * unit_price')
    end
  end
end
