require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'The post model' do
    first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user')
    subject { Post.new(title: 'Test Post', text: 'This is a test post', author: first_user) }
    before { subject.save }

    it 'should not have a blank title' do
      expect(subject.title).to_not be_empty
    end

    it 'should have a title' do
      expect(subject.title).to eq('Test Post')
    end

    it 'should have a text' do
      expect(subject.text).to eq('This is a test post')
    end

    it 'should have an author' do
      expect(subject.author).to eq(first_user)
    end

    # rubocop:disable Layout/LineLength
    it 'checks character count' do
      subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ultrices dui eu tempor  xfsdgff sgfg frfrgfe suscipit. Ut sagittis risus nisi, fermentum ultricies arcu interdum et. Aenean interdum pretium magna. Etiam efficitur aliquam vestibulum. Duis convallis odio nisi. Cras sagittis sagittis turpis, non tincidunt augue sagittis at. Vivamus nec dui et lectus venenatis porttitor. Sed ut sagittis leo, egestas porttitor.'
      expect(subject).to_not be_valid
    end
    # rubocop:enable Layout/LineLength

    it 'loads recent comments' do
      expect(subject.recent_comments).to eq(subject.comments.last(5))
    end

    it 'checks likes counter' do
      expect(subject.likes_counter).to eq(0)
    end
    it 'checks liskes couunter numericality' do
      expect(subject.likes_counter).to be_a(Integer)
    end

    it 'checks comments counter' do
      expect(subject.commets_counter).to eq(0)
    end

    it 'checks comments counter numericality' do
      expect(subject.commets_counter).to be_a(Integer)
    end
  end
end
