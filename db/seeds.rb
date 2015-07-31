require 'faker'

5.times do
  user = User.new(
    name:    Faker::Name.name,
    email:    Faker::Internet.email,
    password:    Faker::Internet.password 
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

8.times do
  topic = Topic.new(
    title: Faker::Commerce.department,
    user: users.sample
    )
  topic.save!
end

topics = Topic.all

urls = ['http://www.bloc.io/', 'http://www.github.com/', 'http://www.stackoverflow.com/', 'http://www.espn.com/', 'http://www.yahoo.com/', 'http://www.teamtreehouse.com/', 'http://www.rubyonrails.org/']

20.times do
  bookmark = Bookmark.create!(
    url: urls.sample,
    topic: topics.sample,
    user: users.sample
    )
end

puts "Created #{User.count} users"
puts "Created #{Topic.count} topics"
puts "Created #{Bookmark.count} bookmarks"




































