class Book < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorites_user(user_id, book_id)
		Favorite.where(user_id: user_id, book_id: book_id).exists?
  end
end
