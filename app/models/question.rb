class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :course

  validates :author,  presence: true
  validates :course,  presence: true
  validates :content, presence: true

  before_create :generate_uid

  def to_param
    uid
  end

  private

  # Generates a unique id and stores it in the database
  # Taken from http://stackoverflow.com/a/12109098 Stackoverflow | Krule | 12th May 2015, 02:52 pm
  def generate_uid
    self.uid = loop do
      random_uid = SecureRandom.urlsafe_base64(7)
      break random_uid unless Course.exists? uid: random_uid
    end
  end
end
