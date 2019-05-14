require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
    @like = Like.create(user_id: @user.id, post_id: @post.id)
  end

  context '有効なコメント' do
    it '有効なコメントの検証' do
      expect(@like).to be_valid
    end
  end

  context '無効なコメント' do
    it '投稿の存在' do
      @like.post_id = ""
      expect(@like).not_to be_valid
    end
    it '投稿の存在' do
      @like.user_id = ""
      expect(@like).not_to be_valid
    end
  end
end
