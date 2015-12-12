require 'rails_helper'

describe "the registration process", :type => :feature do

  it "registers a user" do
    visit new_user_registration_path
    within("form#new_user") do
      fill_in 'user_username', with: "User2"
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password12'
      fill_in 'user_password_confirmation', with: 'password12'
    end
    click_button 'registration_submit'
    expect(page).to have_content 'Welcome to grasp, User2!'
  end
end
