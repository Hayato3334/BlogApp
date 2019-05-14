require 'rails_helper'

describe 'マイページの編集', type: :system do
  let(:user_email) { 'a@exsample.com' }
  let(:user_name) { 'a' }
  let(:user_password) { 'password2' }
  let(:user_password_confirmation) { 'password2' }
  let(:user_current_password) { 'password' }

  before do
    user = create(:user)
    login_as(user)
    visit edit_user_registration_path(user)
    fill_in 'メールアドレス', with: user_email
    fill_in 'アカウント名', with: user_name
    fill_in 'パスワード', with: user_password
    fill_in '確認用パスワード', with: user_password_confirmation
    fill_in '現在のパスワード', with: user_current_password
    click_button '更新'
  end

  shared_examples_for '編集失敗' do
    it { expect(page).to have_css "#error_explanation" }
  end

  context '有効な情報が発信された場合' do
    it '編集成功' do
      expect(page).to have_content 'Welcome to BlogApp'
    end
  end

  context '無効なメールアドレスが発信された場合' do
    let(:user_email) { '' }
    it_behaves_like '編集失敗'
  end

  context '無効なアカウント名が発信された場合' do
    let(:user_name) { '' }
    it_behaves_like '編集失敗'
  end

  context '無効な新規パスワードが発信された場合' do
    let(:user_password) { '' }
    it_behaves_like '編集失敗'
  end

  context '無効な確認用パスワードが発信された場合' do
    let(:user_password_confirmation) { '' }
    it_behaves_like '編集失敗'
  end

  context '無効な現在のパスワードが発信された場合' do
    let(:user_current_password) { '' }
    it_behaves_like '編集失敗'
  end
end
