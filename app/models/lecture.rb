class Lecture < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true
end
