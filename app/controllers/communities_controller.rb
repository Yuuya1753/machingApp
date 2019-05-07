class CommunitiesController < ApplicationController
	def new
		@community = Community.new
	end
	
	def create
		@community = Community.new(community_params)
		
		if @community.save
			@community.joins.create(user: current_user)
			redirect_to root_path, notice: "#{@community.name}を作成しました。"
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

	private
	def community_params
		params.require(:community).permit(:created_id, :name, :icon)
	end
end
