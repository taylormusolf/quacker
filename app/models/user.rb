# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  age             :integer          not null
#  pa              :string
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord

    after_initialize :ensure_session_token
    # or
    # before_validation :ensure_session_token


    # Only username and session_token need to be unique, NOT password_digest
    validates :username, :email, :session_token, presence: true, uniqueness: true
    validates :age, presence: true
    validates :password_digest, presence: true
    # We want to validate that, if a password is provided, it has a length of at least 6
    # We want to allow nil since we won't always include password in our params (example: update action)
    # This validation requires a @password instance variable to be set as well as an attr_reader
    validates :password, length: {minimum: 6, allow_nil: true}

    has_many :posts,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Post 

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like 
    
    has_many :liked_posts,
        through: :likes,
        source: :post 

        

        # FIGVAPER - user model
        # - F - self.find_by_credentials
        # - I - is_password?
        # - G - generate_session_token
        # - V - validations
        # - A - after_initialize / before_validation
        # - P - password/password=
        # - E - ensure_session_token
        # - R - reset_session_token
     
    def self.find_by_credentials(username, password)
        # find a user by their username
        user = User.find_by(username: username)
        # check if the user exists (username is in db) AND the password is correct (using instance method)
        if user && user.is_password?(password) # could also name the method check_password?
            user
        else
            # if username isn't found, or password is incorrect, return nil
            nil
        end
    end
    
    def is_password?(password)
        # `self.password_digest` is a string from the db. we can turn it back into a BCrypt Password by passing it as an argument of Bcrypt::Password.new()
        # Bcrypt::Password.new() takes an existing digest and returns a Bcrypt Password instance
        password_object = BCrypt::Password.new(self.password_digest)
        # It looks like a string, but check out its `.class` method!
        # We can call `.is_password?` on the instance, passing a string of our submitted password
        # Bcrypt will be able to tell if the digest was generated from that password, and returns a boolean
        password_object.is_password?(password)
    end

    def password
        @password
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
   
    def reset_session_token!
        # We want to call this method any time we're: 
        # logging in a user - to ensure they aren't left logged in elsewhere
        # logging out a user - to ensure their session_token is no good once they log out
        self.session_token = SecureRandom::urlsafe_base64
        # make sure the new token persists!
        # use save with a ! to help debug
        self.save!
        # return the new token for convenience
        self.session_token
    end

    def ensure_session_token
        # since this method is run everytime we validate if we use before_validation, we only want to assign session_token
        # if it isn't already provided. Otherwise, we'll reset it when we update as well
        # and log out our user!
        self.session_token ||= SecureRandom::urlsafe_base64 
        # urlsafe_base64 generates a random string for us that is urlsafe and base64 encoded.
    end


        
    # Demo 1

    #Get first user record, use first
    # User.first
    # #Get last user record, use last
    # User.last
    # #Find a user that exists by id, use find
    # User.find(13)
    # #Find a user that doesn't exist by id, use find
    # #User.find(14) #when we use .find with non-existing id then we will get an error from ActiveRecord
    # #Find a user by username, use find_by
    # User.find_by(username: 'like_mike')
    # #Find a user by username that does not exist, use find_by
    # User.find_by(username: 'not_mike')
    # #find_by will return 'nil' if record does not exist

    # # Demo 2

    # #Find all users between the ages of 10 and 20 inclusive. Show their username, and political affiliation.
    # User.select(:username, :pa).where(age: 10..20)
    # #Find all users not younger than the age of 11. Use `where.not`
    # User.where.not("age < 11")
    # #Find all political_affiliations of our users
    # User.select(:pa).distinct
    # User.select(:pa).group(:pa)
    # #Find all users who has a political affiliation in this list and order by ascending username
    # #political_affiliations = ["Ruby", "C"]
    # User.where(pa: ["Ruby", "C"]).order(username: :asc)
end
