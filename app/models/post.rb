# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :body, presence: true
    validate :body_too_long

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :likes,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :Like
        
    has_many :likers,
        through: :likes,
        source: :liker

    # belongs_to is meta programming generating a method author
    # the foreign key here will be validated automatically 

    def body_too_long
        if body && body.length > 140 
            errors[:body] << 'Too Long'
        end
    end

   
    #Find all posts for a particular user
    # Post.joins(:author).where(users: {username: "wakka_wakka"}) #query database once
    # User.find_by(username: "wakka_wakka").posts #query database twice

    # #Find all posts liked by people politically affiliated with JavaScript
    # Post.joins(:likers).where(users: {pa: "JavaScript"})

    # #Get only the unique values from the previous query
    # Post.joins(:likers).where(users: {pa: "JavaScript"}).distinct

    # #Find all posts with no likes
    # Post.left_outer_joins(:likes).where(likes: {id: nil})

    # #Find how many likes each post has
    # Post.joins(:likes).select(:id, :body, "COUNT(likes.id) as num_likes").group(:id)
    # Post.left_joins(:likes).group(:id).pluck("COUNT(likes.id)")

    # #Find posts with at least 3 likes
    # Post.joins(:likes).group(:id).having("COUNT(*) >= 3").pluck(:body) #returns array
    # Post.joins(:likes).group(:id).having("COUNT(*) >= 3").select(:body) #returns ruby objects

    # #SELECT "posts".id, "likes".id FROM "posts" INNER JOIN "likes" ON "likes"."post_id" = "posts"."id";
    # # Includes #

    # def self.see_post_authors_n_plus_one
    #     # the "+1"
    #     posts = Post.all

    #     # the "N"
    #     posts.each do |post|
    #         puts post.author.username
    #     end

    # end

    # def self.see_posts_optimized
    #     # pre-fetches data
    #     posts = Post.includes(:author).all

    #     posts.each do |post| 
    #     # uses pre-fetched data 
    #         puts post.author.username
    #     end
    # end

    # # Joins #

    # def self.see_post_num_likes_n_plus_one
    #     posts = Post.all

    #     posts.each do |post|
    #         puts post.likes.length
    #     end
    # end

    # def self.see_post_num_likes_optimized
    #     posts_with_likes = Post
    #         .select("posts.*, COUNT(*) AS num_likes")
    #         .joins(:likes)
    #         .group(:id)
    
    #     posts_with_likes.each do |post|
    #         puts post.num_likes
    #     end
    # end

end


