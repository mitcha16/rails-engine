class Merchant < ActiveRecord::Base
  include Finder
  has_many :items
end
