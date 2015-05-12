class Board < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_and_belongs_to_many :members, class_name: 'User'

  validates :owner, presence: true

  def formatted_id
    "##{id}"
  end

  def has_owner?(user)
    owner === user
  end

  def has_member?(user)
    has_owner?(user) || members.include?(user)
  end
end
