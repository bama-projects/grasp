class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Regexp checks for an initial character and a length of at least three
  # Taken from http://stackoverflow.com/a/6102146 | Shea Levy | 12th May 2015, 7:56 am
  validates :username, presence: true, uniqueness: true, format: { with: /[a-zA-Z][a-zA-Z0-9_]{2,}/,
                                                         message: 'only allows letters and numbers starting with a character.' }
end
