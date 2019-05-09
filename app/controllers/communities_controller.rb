class CommunitiesController < ApplicationController
	before_action :set_community, only: [:edit, :update, :show, :join]
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
		if @community.update(community_params)
			redirect_to community_path(params[:id]), notice: "更新しました。"
		else
			render :edit
		end
	end

	def show
		ids = @community.users.ids.sort
		if ids.bsearch_index { |i| i == current_user.id }.nil?
			@member = false
		else
			@member = true
		end
	end

	def join
		@community.joins.create(user: current_user)
		redirect_to community_path(@community), notice: "#{@community.name}に参加しました。"
	end

	def destroy
	end

	def search
		@q = Community.ransack(params[:q])
	end

	def result
		@q = Community.ransack(search_params)
		@q.sorts = 'created_at desc' if @q.sorts.empty?
		@communities = @q.result(distinct: true)
	end

	private
	def community_params
		params.require(:community).permit(:created_id, :name, :icon)
	end

	def search_params
		params.require(:q).permit(:name_cont)
	end

	def set_community
		@community = Community.find(params[:id])
	end
end
