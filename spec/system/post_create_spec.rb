require 'rails_helper'

describe '記事投稿機能', type: :system do
  let(:user) {create(:user)}
  let(:title_name) { 'サクセス' }
  let(:body_name) { 'サクセス' }

  before do
    login_as(user)
    visit new_post_path
    fill_in 'タイトル', with: title_name
    fill_in '記事', with: body_name
    click_button '登録する'
    click_button '登録'
  end

  context "有効な情報送信" do
    it "投稿成功" do
      expect(page).to have_selector '.alert-success', text: 'サクセス'
    end
  end

  context "タイトル未入力" do
    let(:title_name) { '' }
    it "タイトルエラー" do
      within '#errors_explanation' do
        expect(page).to have_content 'タイトルを入力してください'
      end
    end
  end

  context "記事未入力" do
    let(:body_name) { '' }
    it "記事エラー" do
      within '#errors_explanation' do
        expect(page).to have_content '記事を入力してください'
      end
    end
  end

end
