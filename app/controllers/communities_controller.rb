class CommunitiesController < ApplicationController
	before_action :set_community, only: [:edit, :update, :show, :join, :destroy]
	def new
		@community = Community.new
	end
	
	def create
		@community = Community.new(community_params)
		
		if @community.save
			@community.joins.create(user: current_user)
			redirect_to community_path(@community), notice: "#{@community.name}を作成しました。"
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
		joins = Join.where('user_id = ? and community_id = ?', current_user.id, @community.id).size
		if joins > 0
			@member = true
		else
			@member = false
		end
		# ids = @community.users.ids.sort
		
		# if ids.find { |i| i == current_user.id }.nil?
		# 	@member = false
		# else
		# 	@member = true
		# end
	end

	def join
		@community.joins.create(user: current_user)
		redirect_to community_path(@community), notice: "#{@community.name}に参加しました。"
	end

	def destroy
		@community.destroy
		redirect_to communities_search_path, notice: "#{@community.name}を削除しました。"
	end

	def search
		if params[:q].present?
			@display_result = true
		else
			@display_result = false
		end
		@q = Community.ransack(params[:q])
		@q.sorts = 'created_at desc' if @q.sorts.empty?
		@communities = @q.result(distinct: true).page(params[:page])
	end

	def download
		if current_user.nil?
			render :plain => "Access denied. Unauthorized access.", :status => :unauthorizd
		else
			path = "./" + request.fullpath
			send_file path, :x_sendfile => true
		end
		fresh_when(last_modified: File.mtime(path))
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
