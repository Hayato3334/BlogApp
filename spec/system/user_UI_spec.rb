require 'rails_helper'

describe 'ユーザー一覧/詳細ページのUI', type: :system do
  before do
    @user = create(:user)
    @other_user = create(:user, email: "other@example.com")
    @post = create(:post, user: @user)
  end

  describe 'ユーザー一覧表示機能' do
    before do
      visit users_path
    end
    it '登録ユーザーの表示' do
      expect(page).to have_content 'テストユーザー'
    end
  end

  describe 'ユーザー詳細表示機能' do
    context 'マイページの表示' do
      before do
        login_as(@user)
        visit user_path(@user)
      end
      it '記事投稿へのリンクの表示' do
        expect(page).to have_link '新規投稿!'
      end
      it '投稿記事の表示' do
        expect(page).to have_link 'テスト'
      end
    end

    context '他ユーザーのページ' do
      before do
        login_as(@other_user)
        visit user_path(@user)
      end
      it '記事投稿へのリンクが表示されない' do
        expect(page).not_to have_link '新規投稿!'
      end
      it '投稿記事の表示' do
        expect(page).to have_link 'テスト'
      end
    end
  end
end
