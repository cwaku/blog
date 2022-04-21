require 'rails_helper'

RSpec.describe 'Login features' do
    before(:each) do
       @user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'tom@example.com',
        password: '123456', confirmed_at: Time.now, posts_counter: 0)
        visit user_session_path
    end
    describe 'Viewing the login form' do
        it 'it shows username and password inputs and the Submit button' do
            expect(page).to have_field(type: 'email')
            expect(page).to have_field(type: 'password')
            expect(page).to have_button(type: 'submit')
        end
    end
    describe 'Submitting login form' do
        it 'displays error on clicking the submit button without filling in the username or password' do
            fill_in('Email', with: @user.email)
            fill_in('Password', with: '')
            click_button('Log in')
            expect(page).to have_content('Invalid Email or password.')
        end 
        it 'displays error on clicking the submit button with incorrect data' do
            fill_in('Email', with: 'fiker@fiker.com')
            fill_in('Password', with: 'fiker')
            click_button('Log in')
            expect(page).to have_content('Invalid Email or password.')
        end 
        it 'Submitting form with  the correct email and password' do
            
            fill_in 'Email', with: @user.email
            fill_in 'Password', with: @user.password
            click_button 'Log in'
            expect(current_path).to eq root_path
        end  
    end
end