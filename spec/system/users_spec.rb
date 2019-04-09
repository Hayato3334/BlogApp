require 'rails_helper'

context 'ユーザーログイン' do
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: 'a@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'Log in'
  end
  it 'ユーザーAが作成したタスクが表示される。' do
    expect(page).to have_content '最初のタスク'
  end
end
