require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'The post' do
    before(:each) do
    first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user', email: 'aass@example.com', password: 'password')
    first_post = Post.create(title: 'Test Post', text: 'This is a test post', author_id: first_user.id)
    Like.create!(author_id: first_user.id, post_id: first_post.id)
  end

    # like.save!

    it 'should have likes counter' do
      expect(Like.all.count).to eq(1)
    end

    it 'like must have a correct author' do
      expect(Like.first.author.name).to eq 'Ricky'
    end
  end
end
