class Community < ApplicationRecord
	mount_uploader :icon, ImageUploader

	has_many :joins, foreign_key: 'community_id', dependent: :destroy
	has_many :users, through: :joins
end
