module Finder

  def finder(params)
    sql = "SELECT * FROM #{params[:controller].split("/").last.capitalize} WHERE #{params.keys.first}='#{params.values.first}';"
    ActiveRecord::Base.connection.execute(sql).first
  end
end
