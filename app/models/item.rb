class Item < ActiveRecord::Base
  include Finder
  belongs_to :merchant
end
