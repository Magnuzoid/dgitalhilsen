class Message < ActiveRecord::Base
  #has_many :user_messages
  #has_one :user, through: :user_messages
  belongs_to :user
  attr_accessor :show_at

  validates :title, presence: true, length: {minimum: 3, maximum: 24}
  validates :msg, presence: true, length: {minimum: 50}

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("id like ?", "%#{query}%")
  end

  self.per_page = 10
end
