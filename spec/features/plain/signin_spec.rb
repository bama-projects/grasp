require 'rails_helper'

describe "the signin process", :type => :feature do

  before :each do
    @user = create(:user)
  end

  it "signs user in with email" do
    visit root_path
    within("form.new_user") do
      fill_in 'user_login', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'login-submit-button'
    end
    expect(page).to have_content 'Welcome to grasp,'
  end

  it "signs user in with username" do
    visit root_path
    within("form.new_user") do
      fill_in 'user_login', with: @user.username
      fill_in 'user_password', with: @user.password
      click_button 'login-submit-button'
    end
    expect(page).to have_content 'Welcome to grasp,'
  end

  it "doesn't sign in with wrong password" do
    visit root_path
    within("form.new_user") do
      fill_in 'user_login', with: @user.username
      fill_in 'user_password', with: 'wrong_password'
      click_button 'login-submit-button'
    end
    expect(page).to have_content 'Invalid login or password'
  end

end

# https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
