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


end
