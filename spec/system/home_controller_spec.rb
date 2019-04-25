require 'rails_helper'

describe HomeController, type: :controller do
  # userをcreateし、let内に格納
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      # controller_macros.rb内のlogin_userメソッドを呼び出し
      login_user user
    end

		it "home#indexが表示される" do
			get :index
      expect(response).to render_template :index
      # p response
    end
  end
end