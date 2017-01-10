class Message < ActiveRecord::Base
  attr_accessor :show_at

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("id like ?", "%#{query}%")
  end

  self.per_page = 10
end
