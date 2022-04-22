require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'The post model' do
    before(:each) do
      first_user = User.create!(name: 'Ricky', photo: 'photo.jpg', bio: 'Alien from Earth 300.',
                                email: 'suur@example.com', password: 'password')
      Post.create!(author_id: first_user.id, title: 'BopBop Beep', text: 'This is my first visit to Mars.')
    end

    it 'should not have a blank title' do
      expect(Post.first.title).to_not be_empty
    end

    it 'should have a title' do
      expect(Post.first.title).to eq('BopBop Beep')
    end

    it 'should have a text' do
      expect(Post.first.text).to eq('This is my first visit to Mars.')
    end

    # rubocop:disable Layout/LineLength
    it 'checks character count' do
      post = Post.first
      post.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ultrices dui eu tempor  xfsdgff sgfg frfrgfe suscipit. Ut sagittis risus nisi, fermentum ultricies arcu interdum et. Aenean interdum pretium magna. Etiam efficitur aliquam vestibulum. Duis convallis odio nisi. Cras sagittis sagittis turpis, non tincidunt augue sagittis at. Vivamus nec dui et lectus venenatis porttitor. Sed ut sagittis leo, egestas porttitor.'
      expect(post).to_not be_valid
    end
    # rubocop:enable Layout/LineLength

    it 'checks likes counter' do
      expect(Post.first.comments_counter).to eq(0)
    end
    it 'checks liskes counter numericality' do
      expect(Post.first.likes_counter).to be_a(Integer)
    end

    it 'checks comments counter' do
      expect(Post.first.comments_counter).to eq(0)
    end

    it 'checks comments counter numericality' do
      expect(Post.first.comments_counter).to be_a(Integer)
    end
  end
end
