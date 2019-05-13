require 'rails_helper'

describe '投稿編集', type: :system do
  let(:user) {create(:user)}
  let!(:post) { create(:post, user: user) }
  let(:title_name) { 'サクセス' }
  let(:body_name) { 'サクセス' }

  before do
    login_as(user)
    visit edit_post_path(post)
    fill_in 'タイトル', with: title_name
    fill_in '記事', with: body_name
    click_button '更新する'
  end

  context "有効な情報送信" do
    before do
      click_button '編集'
    end
    it "投稿成功" do
      expect(page).to have_selector '.alert-success', text: 'サクセス'
    end
  end

  context 'タイトル未入力' do
    let(:title_name) { '' }

    it "投稿削除" do
      expect(page).to have_content 'タイトルを入力してください'
    end
  end

  context '記事未入力' do
    let(:body_name) { '' }

    it "投稿削除" do
      expect(page).to have_content '記事を入力してください'
    end
  end

end
