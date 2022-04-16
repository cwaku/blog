require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'The user model' do
    first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user')

    before { first_user.save }

    it 'should not have a blank name' do
      expect(first_user.name).to_not be_empty
    end

    it 'should have a name' do
      expect(first_user.name).to eq('Ricky')
    end

    it 'should have a photo' do
      expect(first_user.photo).to eq('pic.jpg')
    end

    it 'should have a bio' do
      expect(first_user.bio).to eq('I am a test user')
    end

    it 'should have no posts' do
      expect(first_user.posts.count).to eq(0)
    end
end
end
