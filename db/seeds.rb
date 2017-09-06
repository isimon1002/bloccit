 require 'random_data'

 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all
 
 # Create Posts
 5.times do
 # #1
   Post.create!(
 # #2
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
  # Create Sponsored Posts
 100.times do
 # #1
   SponsoredPost.create!(
 # #2
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price: RandomData.random_integer
   )
 end
 sponsored_posts = SponsoredPost.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "#{Post.count}"
 Post.find_or_create_by(title: "This title is really unique", body: "This body is super unique")
 puts "#{Post.count}"
 
 puts "#{Comment.count}"
 Comment.find_or_create_by(post: Post.find(5), body: "Very very very unique comment")
 puts "#{Comment.count}"
 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{SponsoredPost.count} sponsored posts created"