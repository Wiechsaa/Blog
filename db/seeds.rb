require 'faker'

def create_users
  puts 'Creating Users'
  return if User.count >= 1

  @user = User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password')
end

def create_posts
  puts 'Creating Posts'
  return if Post.count >= 5

  5.times do |i|
    Post.create(title: "Post #{i + 1}", body: Faker::Lorem.paragraph, user_id: User.first.id)
  end
end

create_users
create_posts
