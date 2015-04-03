class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy

  validates :category, presence: true

  def to_s
    return "id: #{id}, category: #{category}"
  end

end
