require 'rails_helper'

describe '記事一覧/詳細ページのUI', type: :system do
  before do
    @user = create(:user)
    @other_user = create(:user, email: "other@example.com")
    @post = create(:post, user: @user)
  end

  describe "記事一覧表示機能" do
    before do
      login_as(@user)
      visit posts_path
    end
    it "投稿記事の表示" do
      expect(page).to have_content 'テスト'
    end
  end

  describe "記事詳細機能" do
    context "投稿者からみた時" do
      before do
        login_as(@user)
        visit post_path(id: @post.id)
      end
      it "記事の表示および編集/削除ボタンの表示" do
        expect(page).to have_content 'テスト'
        expect(page).to have_link '編集'
        expect(page).to have_selector 'a[data-method=delete]', text: '削除'
      end
    end

    context "他のユーザーからみた時" do
      before do
        login_as(@other_user)
        visit post_path(id: @post.id)
      end
      it "記事の表示および編集/削除ボタンの表示" do
        expect(page).to have_content 'テスト'
        expect(page).not_to have_link '編集'
        expect(page).not_to have_selector 'a[data-method=delete]', text: '削除'
      end
    end
  end
end
