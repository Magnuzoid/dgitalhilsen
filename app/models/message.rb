class Message < ActiveRecord::Base
  #has_many :user_messages
  #has_one :user, through: :user_messages
  belongs_to :user

  validates :title, presence: true, length: {minimum: 3, maximum: 24}


  def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      if query.blank?
        where(nil)
      else
        where("title like ?", "%#{query.downcase}%")
      end
  end

  self.per_page = 10
end
