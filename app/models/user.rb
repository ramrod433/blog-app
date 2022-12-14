class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  # validates :postsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  # method to return the 3 most recent posts for a given user
  def recent_post
    posts.limit(3).order(created_at: :desc)
  end

  def admin?
    role == 'admin'
  end
end
