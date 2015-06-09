class FileAttachment < ActiveRecord::Base
  belongs_to :question

  validates :question, presence: true

  has_attached_file :file,   path: "public/files/attachments/:id/:basename.:extension",
                             url:  "attachments/:id/:basename.:extension"

  # Throws error messages for image properties
  # Taken from http://stackoverflow.com/a/19806340 | mgtcampbell | 12th May 2015, 10:56 am
  validates_attachment :file, size: { in: 0..5.megabytes, message: 'size must be less than 5 megabytes' }
  
  do_not_validate_attachment_file_type :file
end
