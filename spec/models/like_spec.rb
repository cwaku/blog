require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'The post' do
    first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user')
    first_post = Post.create(title: 'Test Post', text: 'This is a test post', author: first_user)
    like = Like.new(author: first_user, post: first_post)

    like.save!

    it 'should have likes counter' do
      expect(first_post.likes.count).to eq(1)
    end
  end
end
