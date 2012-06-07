object @post
attributes :id, :title, :body

child :comments do
  attributes :id, :email, :body
end