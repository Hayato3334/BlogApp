require 'rails_helper'

describe 'いいね機能', type: :system, js: true do
  before do
    user = create(:user)
    @post = create(:post, user: user)
    login_as(user)
    visit post_path(@post)
  end
  context 'いいねする' do
    before do
      click_link '0', href: post_likes_path(@post.id)
    end
    xit 'いいね成功' do
      expect(page).to have_link '1'
    end
  end
end
