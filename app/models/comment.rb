class Comment < ActiveRecord::Base
  attr_accessible :body, :post, :email, :post_id

  belongs_to :post, :counter_cache => true
end
