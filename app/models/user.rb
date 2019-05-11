class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :footprints, foreign_key: 'user_id', dependent: :destroy
  has_many :joins, foreign_key: 'user_id'
  has_many :communities, through: :joins
  has_many :likes_to, class_name: "Like", foreign_key: 'user_id', dependent: :destroy
  has_many :likes_from, class_name: "Like", foreign_key: 'like_user_id', dependent: :destroy
  has_many :like_others, through: :likes_to, source: :like_other
  has_many :like_us, through: :likes_from, source: :like_me

  validates :name, uniqueness: true
end
