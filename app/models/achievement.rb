class Achievement < ActiveRecord::Base
  belongs_to :course

  validates :title,  presence: true
  validates :points, presence: true
end
