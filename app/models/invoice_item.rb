class InvoiceItem < ActiveRecord::Base
  include Finder
  belongs_to :invoice
  belongs_to :item
end
