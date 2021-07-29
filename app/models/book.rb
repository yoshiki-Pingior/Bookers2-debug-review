class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	has_many :book_comments, dependent: :destroy

	#search_model
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE? or body LIKE?", "#{word}","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE? or body LIKE?", "#{word}","#{word}")
    elsif search == "backword_match"
      @book = Book.where("title LIKE? or body LIKE?", "#{word}","#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE? or body LIKE?", "#{word}","#{word}")
    else
      @book = Book.all
    end
  end
  
end
