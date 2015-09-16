module Finder
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_attribute(params)
      sql = "SELECT * FROM #{params[:controller].split("/").last.capitalize}
      WHERE #{params.keys.first}='#{params.values.first}';"
      ActiveRecord::Base.connection.execute(sql).first
    end

    def find_all_matches(params)
      sql = "SELECT * FROM #{params[:controller].split("/").last.capitalize}
      WHERE #{params.keys.first}='#{params.values.first}';"
      results = ActiveRecord::Base.connection.execute(sql)
      results.map do |result|
        result
      end
    end

    def random(params)
      size = "SELECT COUNT(1) FROM #{params[:controller].split("/").last.capitalize}"
      table_size = ActiveRecord::Base.connection.execute(size).first['count']
      random = Random.new.rand(table_size.to_i)
      
      sql = "SELECT * FROM #{params[:controller].split("/").last.capitalize}
      WHERE id='#{random}';"
      ActiveRecord::Base.connection.execute(sql).first
    end
  end
end
