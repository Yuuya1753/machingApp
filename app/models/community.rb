class Community < ApplicationRecord
	has_many :joins, foreign_key: 'community_id'
	has_many :users, through: :joins
end
