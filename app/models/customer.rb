class Customer < ActiveRecord::Base
  include Finder
  has_many :invoices
  has_many :transactions, through: :invoices
end
