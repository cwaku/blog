require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'The comments model' do
    first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user')
    first_post = Post.create(title: 'Test Post', text: 'This is a test post', author: first_user)
    first_comment = Comment.create(text: 'This is a test comment', author: first_user, post: first_post)

    first_comment.save

    it 'should have a text' do
      expect(first_comment.text).to eq('This is a test comment')
    end

    it 'should have an author' do
      expect(first_comment.author).to eq(first_user)
    end

    it 'comment must be present' do
      expect(first_post.comments.count).to eq(1)
    end
  end
end
