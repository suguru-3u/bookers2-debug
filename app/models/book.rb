class Book < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorites_user(user_id, book_id)
		Favorite.where(user_id: user_id, book_id: book_id).exists?
  end


	def Book.search(search, user_or_post, how_search)
        if how_search == "1"
					Book.where(['title LIKE ?', "#{search}"])
        elsif how_search == "2"
					Book.where(['title LIKE ?', "#{search}%"])
        elsif how_search == "3"
					Book.where(['title LIKE ?', "%#{search}"])
        elsif how_search == "4"
					Book.where(['title LIKE ?', "%#{search}%"])
        else
          Book.all
        end
    end
end
