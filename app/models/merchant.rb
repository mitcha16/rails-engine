class Merchant < ActiveRecord::Base

  def self.finder(params)
    sql = "SELECT * FROM Merchants WHERE #{params.keys.first}='#{params.values.first}';"
    m= ActiveRecord::Base.connection.execute(sql).first
    self.find(m["id"])
  end
end
