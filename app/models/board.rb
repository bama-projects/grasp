class Board < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_and_belongs_to_many :members, class_name: 'User'

  validates :owner, presence: true

  def formatted_id
    "##{id}"
  end
end
