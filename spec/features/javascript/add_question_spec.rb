require 'rails_helper'

describe "Adding Questions", :type => :feature do
  let(:lecture) {create(:lecture) }
  let(:course) {lecture.course}

  before :each do
    login_as(lecture.course.owner, :scope => :user)
  end

  it "adds a question to the first lecture" do
    expect do
      puts path = new_course_question_path(course.uid)
      visit path
      expect(page).to have_content 'New question'
      fill_in 'question_content', with: "Here's my question!"
      find('button.green').click
    end.to change{lecture.questions.count}.from(0).to(1)
  end

end
