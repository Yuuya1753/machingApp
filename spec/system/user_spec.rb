require 'rails_helper'

RSpec.feature 'ユーザーが', type: :feature do
  context 'ログイン後' do
    include_examples :sign_in

		scenario 'プロフィールの更新が出来た' do
			visit edit_user_path(current_user.id)
			fill_in "ユーザー名",	with: "変更後"
			click_button "更新"

			expect(page).to have_selector ".alert-success", text: "更新しました。"
      # current_user # ログイン済みのユーザー
		end
		
		scenario 'ユーザーの検索が出来た' do
			# before do
				user_2 = FactoryBot.create(:user, name: "テスト2")
			# end
			
			visit users_search_path
			fill_in "ユーザー名",	with: "テスト2"
			click_button "検索する"

			expect(page).to have_content "テスト2"
		end
  end
end