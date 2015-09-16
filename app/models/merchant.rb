
class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def revenue
    {"revenue"=>"#{calculate_revenue}"}
  end

  def self.most_revenue(params)
    all.max(params[:quantity].to_i) do |merchant|
      merchant.calculate_revenue
    end
  end

  def calculate_revenue
    invoices.success.joins(:invoice_items).sum('quantity * unit_price')
  end
end
