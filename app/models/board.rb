class Board < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_and_belongs_to_many :members, class_name: 'User'

  validates :owner, presence: true
  validates :title, presence: true

  before_create :generate_uid

  def to_param
    uid
  end

  def formatted_id
    "##{id}"
  end

  def has_owner?(user)
    owner === user
  end

  def has_member?(user)
    has_owner?(user) || members.include?(user)
  end

  private

  # Generates a unique id and stores it in the database
  # Taken from http://stackoverflow.com/a/12109098 Stackoverflow | Krule | 12th May 2015, 02:52 pm
  def generate_uid
    self.uid = loop do
      random_uid = SecureRandom.urlsafe_base64(7)
      break random_uid unless Board.exists? uid: random_uid
    end
  end
end
