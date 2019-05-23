class MatchesController < ApplicationController
	before_action :set_match, only: [:show]
	def show
		@beforeTime = "9999/99/99"
	end

	private
	def set_match
		@match = Match.find(params[:id])
	end
end
