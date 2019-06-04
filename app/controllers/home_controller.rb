class HomeController < ApplicationController
  before_action :user_sign_in, only: [:index]

  def index
  end

  private
  def user_sign_in
    if !user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
