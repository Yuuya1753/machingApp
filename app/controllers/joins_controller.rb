class JoinsController < ApplicationController
  def create
  end

  private
  def join_params
    params.require(:join).permit(:user_id, :community)
  end
end
