class Comment < ActiveRecord::Base
  attr_accessible :body, :post, :email, :post_id

  belongs_to :post, :counter_cache => true

  validates_presence_of :body, :email
  validates_email_format_of :email
end
