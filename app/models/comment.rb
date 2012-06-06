class Comment < ActiveRecord::Base
  attr_accessible :body, :post, :email

  belongs_to :post, :counter_cache => true
end
