class Comment < ActiveRecord::Base
  has_many    :replies,          class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to  :parent_comment,   class_name: "Comment"
  belongs_to  :user
  belongs_to  :model

  validates_presence_of :content, message: '留言至少兩個字'
  validates :comment_on, inclusion: { in: %w(CONTRIBUTIONS MODEL) }

  scope :hidden, -> { where(is_hidden: true) }
  default_scope  -> { where(is_hidden: false) }

  include AutoHtml
  auto_html_for :content do
    html_escape
    image
    youtube(:width => '100%', :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def self.recently_comments_on_model(last_n_days = 7, max_number = 20)
    raise 'last_n_days should be integer' unless last_n_days.is_a?(Integer)
    raise 'max_number should be integer' unless max_number.is_a?(Integer)
    Comment.where(comment_on: 'MODEL').where.not(model_id: nil).where("created_at >= :last_n_days", :last_n_days => Time.now - last_n_days.days).order(created_at: :desc).limit(max_number)
  end

end
