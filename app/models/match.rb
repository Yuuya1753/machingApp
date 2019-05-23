class Match < ApplicationRecord
	belongs_to :match_to_user, class_name: "User", foreign_key: "to_user_id"
	belongs_to :match_from_user, class_name: "User", foreign_key: "from_user_id"
	has_many :messages, foreign_key: "matching_id", dependent: :destroy
end
