require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @comment = create(:comment, user: @user, post: @post)
  end

  context '有効なコメント' do
    it '有効なコメントの検証' do
      expect(@comment).to be_valid
    end
  end
  context '無効なコメント' do
    it 'コメントの存在' do
      @comment.content = ""
      expect(@comment).not_to be_valid
    end
    it 'コメントの長さ' do
      @comment.content = "a" * 141
      expect(@comment).not_to be_valid
    end
    it '投稿者の存在' do
      @comment.user_id = ""
      expect(@comment).not_to be_valid
    end
    it '投稿の存在' do
      @comment.post_id = ""
      expect(@comment).not_to be_valid
    end
  end
end
