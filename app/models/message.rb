class Message < ApplicationRecord
	belongs_to :match, foreign_key: "matching_id"

	validates :text, presence: true
end
