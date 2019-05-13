require 'rails_helper'

describe 'ユーザー新規登録', type: :system do
  let(:user_email) { 'test@exsample.com' }
  let(:user_name) { 'テストユーザー' }
  let(:user_password) { 'password' }
  let(:user_password_confirmation) { 'password' }

  before do
    visit new_user_registration_path
    fill_in 'メールアドレス', with: user_email
    fill_in 'アカウント名', with: user_name
    fill_in 'パスワード', with: user_password
    fill_in '確認用パスワード', with: user_password_confirmation
    click_button '登録'
  end

  shared_examples_for 'ログイン失敗' do
    it { expect(page).to have_css "#error_explanation" }
  end


  context '有効な情報が発信された時' do
    it 'ログイン' do
      expect(page).to have_selector '.alert-success', text: 'アカウント登録が完了しました。'
    end
  end

  context '無効なパスワードが発信された時' do
    let(:user_password) { '' }
    it_behaves_like 'ログイン失敗'
  end

  context '無効な確認用パスワードが発信された時' do
    let(:user_password_confirmation) { '' }
    it_behaves_like 'ログイン失敗'
  end

  context '無効な名前が発信された時' do
    let(:user_name) { '' }
    it_behaves_like 'ログイン失敗'
  end

  context '無効なアドレスが発信された時' do
    let(:user_email) { '' }
    it_behaves_like 'ログイン失敗'
  end
end
