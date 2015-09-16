class Item < ActiveRecord::Base
  include Finder
  belongs_to :merchant
  has_many :invoice_items
end
