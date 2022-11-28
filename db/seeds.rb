# frozen_string_literal: true

require 'faker'

def create_users
  puts 'Creating Users'
  return if User.count >= 1

  @admin = User.create(email: 'wiechsa@example.com',
                       name: 'Wiechsa',
                       role: User.roles[:admin],
                       password: 'password',
                       password_confirmation: 'password')

  @user = User.create(email: 'user@example.com',
                      name: 'Example',
                      role: User.roles[:user],
                      password: 'password',
                      password_confirmation: 'password')
end

def create_categories
  puts 'Creating Categories'
  return if Category.count >= 3

  Category.create(name: 'Uncategorized', visible: true)
  Category.create(name: 'Programing', visible: true)
  Category.create(name: 'Gaming', visible: true)
end

def create_posts
  puts 'Creating Posts'
  return if Post.count >= 3

  3.times do |i|
    post = Post.create(title: "Post #{i + 1}",
                       body: Faker::Lorem.paragraph,
                       category: Category.first,
                       user_id: User.first.id)

    3.times do |y|
      Comment.create(body: "Comment #{y + 1}", user_id: User.second.id, post_id: post.id)
    end
  end
end

create_users
create_categories
create_posts
