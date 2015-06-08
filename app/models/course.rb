class Course < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_and_belongs_to_many :members, class_name: 'User'

  validates :owner, presence: true
  validates :title, presence: true

  before_create :generate_uid

  attr_accessor :user_emails

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

  def add_members_by_email!(email_addresses)
    email_addresses.delete(' ').split(',').each do |email_address|
      members << @user if @user = User.find_by_email(email_address)
    end
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
