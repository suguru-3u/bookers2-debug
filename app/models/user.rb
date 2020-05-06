class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  # ユーザー情報検索メゾット
  def User.search(search, user_or_post, how_search)
        if user_or_post == "1"
            if how_search == "1"
              User.where(['name LIKE ?', "#{search}"])
            elsif how_search == "2"
              User.where(['name LIKE ?', "#{search}%"])
            elsif how_search == "3"
              User.where(['name LIKE ?', "%#{search}"])
            elsif how_search == "4"
              User.where(['name LIKE ?', "%#{search}%"])
            else
              User.all
            end
         end
    end

end
