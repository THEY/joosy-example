posts = Post.create([
  { title: 'Welcome there', body: 'Hey, welcome to the joosy blog example' },
  { title: 'Test post',     body: 'Nothing there. Really' }
])

1.upto(5) do |x|
  Comment.create(email: Faker::Internet.email, body: Faker::Lorem.words(20), post: posts.first)
end