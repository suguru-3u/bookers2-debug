class Favorite < ApplicationRecord
  belongs_to :book,counter_cache: :favorites_count
  belongs_to :user
  validates :user_id, {presence: true}
  validates :book_id, {presence: true}

  def nice(user)
    favorites.create(user_id: user.id)
  end

  def bad(user)
    favorites.find_by(user_id: user.id).destroy
  end

end
