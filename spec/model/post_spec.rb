require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
  end
  context '有効な投稿' do
    it '有効な投稿の検証' do
      expect(@post).to be_valid
    end
  end
  context '無効な投稿' do
    it 'タイトルの存在' do
      @post.title = ''
      expect(@post).not_to be_valid
    end
    it 'タイトルの長さ' do
      @post.title = 'a' * 31
      expect(@post).not_to be_valid
    end
    it '本文の存在' do
      @post.body = ''
      expect(@post).not_to be_valid
    end
    it '本文の長さ' do
      @post.body = 'a' * 501
      expect(@post).not_to be_valid
    end
    it '投稿者の存在' do
      @post.user_id = ""
      expect(@post).not_to be_valid
    end
  end
end
