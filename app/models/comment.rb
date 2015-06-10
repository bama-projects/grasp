class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :question

  validates :author,   presence: true
  validates :question, presence: true
  validates :content,  presence: true
end
