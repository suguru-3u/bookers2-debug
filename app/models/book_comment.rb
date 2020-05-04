class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book,counter_cache: :comment_count

  validates :comment, presence: true
end
