# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the 'rails db:seed' command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.destroy_all
  
  # Instructors
  elliot = User.create!(username: "all_knowing_elliot", password: "starwars", age: 11, pa: "C", email: "those_are_teef@aa.io")
  ryan = User.create!(username: "will_climb_rocks", password: "starwars", age: 11, pa: "JavaScript" , email: "boulderz@aa.io")
  dean = User.create!(username: "dean_machine", password: "starwars", age: 11, pa: "Ruby", email: "deans_diary@aa.io")
  angela = User.create!(username: "loves_capy", password: "starwars", age: 11, pa: "JavaScript", email: "chosenone@aa.io")
  charlos = User.create!(username: "charlos_gets_buckets", password: "starwars", age: 11, pa: "Ruby", email: "ballin@aa.io")
  alissa = User.create!(username: "cow_luva", password: "starwars", age: 11, pa: "JavaScript" , email: "cows@aa.io")
  joe = User.create!(username: "trader_joes_4lyf3", password: "starwars", age: 11, pa: "Ruby", email: "thetraderjoe@aa.io")
  walker = User.create!(username: "wakka_wakka", password: "starwars", age: 11, pa: "JavaScript", email: "wakka@wakka.walking")
  mike = User.create!(username: "like_mike", password: "starwars", age: 11, pa: "Ruby", email: "mike@aa.io")
  michelle = User.create!(username: "michelle_bell", password: "starwars", age: 11, pa: "JavaScript", email: "michelle@aa.io")
  vanessa = User.create!(username: "the_vanessa", password: "starwars", age: 11, pa: "Ruby", email: "vanessa@aa.io")
  jen = User.create!(username: "jen_ken_intensifies", password: "starwars", age: 11, pa: "JavaScript", email: "jen@aa.io")
  big_company = User.create!(username: "instructors_rock", password: "starwars", age: 52, pa: "Instructors", email: "giveus@money.now")
  
  Post.destroy_all

  # Posts
  post1 = Post.create!(author_id: walker.id, body: "Please use my messaging app, WalkerTalker, it's way better than Slack.")
  post2 = Post.create!(author_id: big_company.id, body: "Hello fellow instructors.")
  post3 = Post.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
  post4 = Post.create!(author_id: michelle.id, body: "Sweeeeeet.")
  post5 = Post.create!(author_id: mike.id, body: "Kahoots are an opportunity to mess with students.")
  post6 = Post.create!(author_id: vanessa.id, body: "I am not Michelle.")
  post7 = Post.create!(author_id: jen.id, body: "This is a random quote I found online. -Some person, 2020.")
  post8 = Post.create!(author_id: walker.id, body: "You can also check out my sweet game. It was made with JavaScript.")
  post9 = Post.create!(author_id: walker.id, body: "JavaScript is the best coding language.")

  post10 = Post.create!(author_id: joe.id, body: "Programmer: A machine that turns coffee into code.")
  post11 = Post.create!(author_id: big_company.id, body: "You're a wizard, instructor.")

  Like.destroy_all

  # Likes

  # Walker
  Like.create!(liker_id: walker.id, post_id: post4.id)
  Like.create!(liker_id: walker.id, post_id: post5.id)
  Like.create!(liker_id: walker.id, post_id: post6.id)
  Like.create!(liker_id: walker.id, post_id: post7.id)
  Like.create!(liker_id: walker.id, post_id: post8.id)
  Like.create!(liker_id: walker.id, post_id: post9.id)
  Like.create!(liker_id: walker.id, post_id: post10.id)

  # Michelle
  Like.create!(liker_id: michelle.id, post_id: post6.id)
  Like.create!(liker_id: michelle.id, post_id: post7.id)
  Like.create!(liker_id: michelle.id, post_id: post8.id)
  Like.create!(liker_id: michelle.id, post_id: post9.id)
  Like.create!(liker_id: michelle.id, post_id: post4.id)
  Like.create!(liker_id: michelle.id, post_id: post10.id)

  # Mike
  Like.create!(liker_id: mike.id, post_id: post4.id)
  Like.create!(liker_id: mike.id, post_id: post5.id)
  Like.create!(liker_id: mike.id, post_id: post6.id)

  # Jen
  Like.create!(liker_id: jen.id, post_id: post5.id)
  Like.create!(liker_id: jen.id, post_id: post6.id)
  Like.create!(liker_id: jen.id, post_id: post10.id)

  # Big Company
  Like.create!(liker_id: big_company.id, post_id: post1.id)
  Like.create!(liker_id: big_company.id, post_id: post4.id)
  Like.create!(liker_id: big_company.id, post_id: post5.id)
  Like.create!(liker_id: big_company.id, post_id: post6.id)
  Like.create!(liker_id: big_company.id, post_id: post7.id)
  Like.create!(liker_id: big_company.id, post_id: post8.id)
  Like.create!(liker_id: big_company.id, post_id: post9.id)
  Like.create!(liker_id: big_company.id, post_id: post10.id)

  # Dean
  Like.create!(liker_id: dean.id, post_id: post10.id)
  Like.create!(liker_id: dean.id, post_id: post11.id)
