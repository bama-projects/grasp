class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :question

  has_one :course, through: :question

  validates :author,   presence: true
  validates :question, presence: true
  validates :content,  presence: true

  def has_author?(user)
    author === user
  end

  def markdown
    markdown_service.render content
  end

  private

  def markdown_service
    @markdown_service ||= Redcarpet::Markdown.new Redcarpet::Render::HTML
  end
end
