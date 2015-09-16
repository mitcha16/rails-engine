class Invoice < ActiveRecord::Base
  include Finder
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
end
