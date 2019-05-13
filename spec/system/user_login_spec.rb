require 'rails_helper'

describe 'ユーザーログイン', type: :system do
  let(:user_email) { 'test@exsample.com' }
  let(:user_password) { 'password' }
  before do
    user = create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with: user_email
    fill_in 'パスワード', with: user_password
    click_button 'ログイン'
  end

  context '有効な情報が発信された時' do
    it 'ログイン' do
      expect(page).to have_selector '.alert-success', text: 'ログインしました。'
      expect(page).not_to have_content "メールアドレス"
    end
  end

  context '無効なパスワードが発信された時' do
    let(:user_password) { '' }
    it 'ログイン失敗' do
      expect(page).to have_content "メールアドレス"
    end
  end

  context '無効なアドレス発信された時' do
    let(:user_email) { '' }
    it 'ログイン失敗' do
      expect(page).to have_content "メールアドレス"
    end
  end
end
