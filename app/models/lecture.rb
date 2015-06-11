class Lecture < ActiveRecord::Base
  belongs_to :course

  validates :course, presence: true
  validates :title,  presence: true
end
