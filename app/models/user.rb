class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]

  # Regexp checks for an initial character and a length of at least three
  # Taken from http://stackoverflow.com/a/6102146 | Shea Levy | 12th May 2015, 7:56 am
  validates :username, presence: true, uniqueness: true, format: { with: /[a-zA-Z][a-zA-Z0-9_]{2,}/,
                                                         message: 'only allows letters and numbers starting with a character' }

  attr_accessor :login

  # Enables to login with username or email in one field
  # Taken from https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  # Damon Yuan | 12th May 2015, 8:26 am
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
