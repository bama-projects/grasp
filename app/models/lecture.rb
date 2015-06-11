class Lecture < ActiveRecord::Base
  belongs_to :course

  has_many :questions

  validates :title, presence: true
end
