module Finder
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_attribute(params)
      filter_ids(ActiveRecord::Base.connection.execute(get_sql(params)).first)
    end

    def find_all_matches(params)
      results = ActiveRecord::Base.connection.execute(get_sql(params))
      results.map do |result|
        filter_ids(result)
      end
    end

    def random(params)
      size = "SELECT COUNT(1) FROM #{params[:controller].split("/").last.capitalize}"
      table_size = ActiveRecord::Base.connection.execute(size).first['count']
      random = Random.new.rand(table_size.to_i)

      sql = "SELECT * FROM #{params[:controller].split("/").last.capitalize}
      WHERE id='#{random}';"
      filter_ids(ActiveRecord::Base.connection.execute(sql).first)
    end

    def get_sql(params)
      "SELECT * FROM #{params[:controller].split("/").last.capitalize}
      WHERE #{params.keys.first}='#{params.values.first}';"
    end

    def filter_ids(result)
      hash_keys = result.keys.select do |key|
        key[-2..-1] == 'id'
      end
      parse(result, hash_keys)
    end

    def parse(result, keys)
      keys.each do |key|
        result[key] = result[key].to_i if result[key]
      end
      result
    end
  end
end
