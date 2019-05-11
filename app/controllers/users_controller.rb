class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :other, :like, :show_likes]

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
		@q = User.ransack(params[:q])
	end

	def result
		@q = User.ransack(search_params)
		@users = @q.result(distinct: true)
	end

	def other
		@user.footprints.create!(leave_id: current_user.id)
		like = Like.where('user_id = ? and like_user_id = ?', current_user.id, @user.id)
		if like.size > 0
			@already_like = true
		else
			@already_like = false
		end
	end

	def footprints
	end

	def like
		current_user.likes.create!(like_user: @user)
		redirect_to other_path(@user), notice: "#{@user.name}さんに「いいね！」しました。"
	end

	def show_likes
		@like_me_count = Like.where('user_id = ?', current_user.id).size
		@like_other_count = Like.where('like_user_id = ?', current_user.id).size
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
end
