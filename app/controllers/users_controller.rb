class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :other]

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
	end

	def footprints
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
