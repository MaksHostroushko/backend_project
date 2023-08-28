# db/seeds.rb

# Creating 20 sample posts
20.times do
  post = Post.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: 3).join("\n\n") # 3 paragraphs per post body
  )

  # Creating 3 comments for each post
  3.times do
    post.comments.create!(
      body: Faker::Movies::HarryPotter.quote
    )
  end
end

puts "Seeded #{Post.count} posts and #{Comment.count} comments!"
