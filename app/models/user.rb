class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :footprints, foreign_key: 'user_id', dependent: :destroy
  has_many :joins, foreign_key: 'user_id'
  has_many :communities, through: :joins

  validates :name, uniqueness: true
end
