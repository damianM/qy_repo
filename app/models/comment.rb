class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  # belongs_to :sender, :class_name => "User"
  # belongs_to :receiver, :class_name => "User"

  validates_presence_of :content
end

