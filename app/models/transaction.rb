class Transaction < ActiveRecord::Base
  include Finder
  belongs_to :invoice
end
