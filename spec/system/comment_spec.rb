require 'rails_helper'

describe 'コメント機能', type: :system, js: true do
  before do
    user = create(:user)
    @post = create(:post, user: user)
    login_as(user)
    visit post_path(@post)
  end
  context 'コメントを作成する' do
    before do
      fill_in 'comment_content', with: 'テスト'
      click_button 'コメントする'
    end
    xit 'コメント成功' do
      expect(page).to have_content 'コメント:'
    end
  end
end
