require 'rails_helper'
# https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
describe "creating a new course", :type => :feature do

  let(:user) {  create(:user) }
  it "has a create course button" do
    login_as(user, :scope => :user)
    visit root_path
    click_button 'create-course-button'
    expect(page).to have_content 'New Course'
  end
  it "creates a course" do
    expect do
      login_as(user, :scope => :user)
      visit 'courses/new'
      within 'form#new_course' do
        fill_in 'course_title', with: 'Info1'
        fill_in 'course_description', with: 'B1: Informatics 1 WS 2015/16'
        choose 'course_public_false'
        find('button.green').click
      end
    end.to change{Course.count}.from(0).to(1)
    expect(page).to have_content 'Course Info1'
  end

end
