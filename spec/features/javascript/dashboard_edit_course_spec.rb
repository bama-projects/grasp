require 'rails_helper'

describe "The Dashboard", :type => :feature do
  let(:user) {  create(:user) }
  let(:course) {  create(:course) }



  describe "(when courses have been created)" do
    before :each do
      login_as(course.owner, :scope => :user)
    end

    it "shows them with selenium", :js => true do
        visit root_path
        expect(page).to have_content(course.title)
    end

    #http://stefan.magnuson.co/articles/rails/robust-integration-testing-in-rails-4-with-rspec-capybara-and-selenium/
    it "add lecture to course", :js => true do
      expect do
        course.owner.owned_courses.inspect
        visit root_path
        expect(page).to have_content(course.title)
        visit edit_course_path(course)
        expect(page).to have_content(course.title)
        click_link 'course-lectures'
        click_link 'add-lecture-link'
        fill_in 'course_lectures_attributes_0_title', with: 'Lecture 1'
        find('button.green').click
      end.to change{course.lectures.count}.from(0).to(1)
      expect(page).to have_content 'Edit Course'
    end
    it "add two lectures to course", :js => true do
      expect do
        visit edit_course_path(course)
        expect(page).to have_content(course.title)
        click_link 'course-lectures'
        click_link 'add-lecture-link'
        fill_in 'course_lectures_attributes_0_title', with: 'Lecture 1'
        click_link 'add-lecture-link'
        fill_in 'course_lectures_attributes_1_title', with: 'Lecture 2'
        find('button.green').click
      end.to change{course.lectures.count}.from(0).to(2)
      expect(page).to have_content 'Edit Course'

    end

  end
end
