require 'rails_helper'

describe '投稿削除', type: :system do

  before do
    user = create(:user)
    post = create(:post, user: user)
    login_as(user)
    visit post_path(post)
    click_link '削除'
    page.accept_confirm "投稿#{post.title}を削除します。よろしいですか？"
  end

  it "投稿削除" do
    expect(page).to have_css("div.alert.alert-success")
  end
end
