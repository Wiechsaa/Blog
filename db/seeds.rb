require 'faker'

def create_posts
  puts 'Creating Posts'
  return if Post.count >= 5

  5.times do |i|
    Post.create(title: "Post #{i + 1}", body: Faker::Lorem.paragraph)
  end
end

create_posts
