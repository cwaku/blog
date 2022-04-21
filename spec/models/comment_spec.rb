require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'The comments model' do
    before(:each) do
      first_user = User.create!(name: 'Ricky', photo: 'photo.jpg', bio: 'Alien from Earth 300.',
                                email: 'suur@example.com', password: 'password')
      first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first visit to Mars.')
      Comment.create!(post_id: first_post.id, author_id: first_user.id, text: 'Beep Bop!')
    end

    it 'should have a text' do
      expect(Comment.first.text).to eq 'Beep Bop!'
    end

    it 'comment must be present' do
      expect(Comment.all.length).to eq 1
    end
  end
end
