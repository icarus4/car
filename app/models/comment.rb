class Comment < ActiveRecord::Base
  has_many    :replies,          class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to  :parent_comment,   class_name: "Comment"
  belongs_to  :user

  validates_presence_of :content, message: '留言至少兩個字'
  validates :comment_on, inclusion: { in: %w(CONTRIBUTIONS MODELS) }

  scope :hidden, -> { where(is_hidden: true) }
  default_scope  -> { where(is_hidden: false) }

end
