class Merchant < ActiveRecord::Base
  include Finder
  has_many :items
  has_many :invoices
end
