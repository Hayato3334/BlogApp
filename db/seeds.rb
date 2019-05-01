Faker::Config.locale = :ja

# ユーザー
User.create!(name:  "Sample",
             email: "sample@blogapp.org",
             password:              "sample",
             password_confirmation: "sample")

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# ブログ
users = User.order(:created_at).take(6)
5.times do |n|
  title = "筋トレ#{n+1}日目"
  body = "ベンチブレス100kg * #{n+1}rep"
  users.each { |user| user.posts.create!(title: title, body: body) }
end

# ライク
users = User.all
posts = Post.all
5.times do |n|
  m = n + 1
  users[0..m].each { |liker| posts[n].likes.create!(user_id: liker.id) }
end
