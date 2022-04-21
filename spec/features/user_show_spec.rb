require 'rails_helper'

RSpec.describe 'user_show_path', type: :feature do
  describe 'User show page' do
    before(:each) do
      @first_user = User.create(name: 'Affaxed', photo: 'link', bio: 'bio', posts_counter: 0,
                                email: 'dev@gmail', password: '123456', password_confirmation: '123456')
      @second_user = User.create(name: 'Bad', photo: 'link', bio: 'bio', posts_counter: 0,
                                 email: 'devi@gmail', password: '123456', password_confirmation: '123456')
      @third_user = User.create(name: 'Bade', photo: 'link', bio: 'bio', posts_counter: 0,
                                email: 'devii@gmail', password: '123456', password_confirmation: '123456')

      visit('/users/sign_in')
      fill_in 'Email', with: 'dev@gmail'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @first_post = Post.create(author: @first_user, title: 'Finding Dora', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Finding Dora', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Finding Dora', text: 'This is my third post')

      visit user_path(@first_user.id)
    end

    it 'displays username' do
      expect(page).to have_content('Affaxed')
    end

    it 'displays number of posts by user' do
      expect(page).to have_content(3)
    end

    it 'displays posts' do
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end

    it 'displays user bio' do
      expect(page).to have_content('bio')
    end

    it 'Check for user profile picture' do
      all('img').each do |i|
        expect(i[:src]).to eq('link')
      end
    end
    it 'displays button to see all posts' do
      expect(page).to have_button('see all posts')
    end

    it 'displays  post onclick and redirects to posts page' do
      click_link 'see all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end
end