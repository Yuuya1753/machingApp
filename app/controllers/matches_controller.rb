class MatchesController < ApplicationController
	before_action :set_match, only: [:show]
	def show
		@beforeTime = "9999/99/99"
		if @match.from_user_id == current_user.id
			@other = User.find(@match.to_user_id)
		else
			@other = User.find(@match.from_user_id)
		end
	end

	def new_display

	end

	private
	def set_match
		@match = Match.find(params[:id])
	end
end
