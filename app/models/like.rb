class Like < ApplicationRecord
	belongs_to :like_me, class_name: "User", foreign_key: 'user_id'
	belongs_to :like_other, class_name: "User", foreign_key: 'like_user_id'
end
