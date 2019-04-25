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
  end
end