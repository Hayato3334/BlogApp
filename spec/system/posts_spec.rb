require 'rails_helper'

describe 'ブログ投稿機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let!(:post_a) { FactoryBot.create(:post, title: '最初の投稿', user: user_a) }

  shared_examples_for '投稿が表示される' do
    it { expect(page).to have_content '最初の投稿' }
  end

  describe '一覧表示機能' do
    context 'ホーム(一覧表示)画面' do

      before do
        visit root_path
      end

      it_behaves_like '投稿が表示される'
    end
  end

  describe '詳細表示機能' do
    context '詳細画面' do

      before do
        visit post_path(post_a)
      end

      it_behaves_like '投稿が表示される'
    end
  end


  describe '新規投稿機能' do
    let(:login_user) { user_a }

    before do
      visit new_user_session_path
      fill_in 'Eメール', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'Log in'
      visit new_post_path
      fill_in 'タイトル', with: title_name
      fill_in '記事', with: body_name
      click_button '登録する'
    end

    context 'タイトル、記事に入力' do
      let(:title_name) { 'サクセス' }
      let(:body_name) { 'サクセス' }

      it '正常に登録' do
        expect(page).to have_selector '.alert-success', text: 'サクセス'
      end
    end

    context 'タイトル未入力' do
      let(:title_name) { '' }
      let(:body_name) { 'エラー1' }

      it 'エラー１' do
        within '#errors_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end

    context '記事未入力' do
      let(:title_name) { 'エラー２' }
      let(:body_name) { '' }

      it 'エラー２' do
        within '#errors_explanation' do
          expect(page).to have_content '記事を入力してください'
        end
      end
    end
  end
end
