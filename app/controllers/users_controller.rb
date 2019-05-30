class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :other, :like, :show_likes, :show_matches]

	def index
		
	end

	def show
	end
	

	def edit
	end
	
	def update
		if @user.update(user_params)
			redirect_to user_path(params[:id]), notice: "更新しました。"
		else
			render :edit
		end
	end

	def search
		if params[:q].present?
			@display_result = true
		else
			@display_result = false
		end
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true).page(params[:page])
	end

	def other
		@user.footprints.create!(leave_id: current_user.id)
		@user.information.create!(content: "#{current_user.name}さんのあしあとがあります。")
		like = Like.where('user_id = ? and like_user_id = ?', current_user.id, @user.id)
		if like.size > 0
			@already_like = true
		else
			@already_like = false
		end
	end

	def footprints
		@footprints = Kaminari.paginate_array(current_user.footprints.reverse).page(params[:page])
	end

	def like
		current_user.likes_from.create!(like_other: @user)
		like_count = Like.where('user_id = ? and like_user_id = ?', @user.id, current_user.id).size
		if like_count > 0
			match(@user)
			redirect_to other_path(@user), notice: "#{@user.name}さんとのマッチングが成立しました。"
		else
			@user.information.create!(content: "#{current_user.name}さんから「いいね！」されました。")
			redirect_to other_path(@user), notice: "#{@user.name}さんに「いいね！」しました。"
		end
	end

	def show_likes
		@like_me_count = Like.where('user_id = ?', current_user.id).size
		@like_other_count = Like.where('like_user_id = ?', current_user.id).size
	end
	
	def show_matches
		@matches = Match.where('from_user_id = ? or to_user_id = ?', current_user.id, current_user.id)
	end
	
	private
	def set_user
		@user = User.find(params[:id])
	end
	
	def user_params
		params.require(:user).permit(:name, :age, :blood_type, :address, :birthplace, :job, :hobby, :self_introduction, :image)
	end
	
	def search_params
		params.require(:q).permit(:name_cont, :age_eq, :blood_type_eq, :address_eq, :birthplace_eq, :job_cont, :hobby_cont)
	end

	def match(user)
		current_user.matches_from.create!(match_to_user: user)
		user.information.create!(content: "#{current_user.name}さんとのマッチングが成立しました。")
	end
end
