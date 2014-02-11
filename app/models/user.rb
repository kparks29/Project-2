class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  attr_accessor :password, :password_confirmation

  field :first_name, type: String
  field :last_name, type: String
  field :name, type: String
  field :email, type: String
  field :city, type: String
  field :location, type: String
  field :date_of_birth, type: Date
  field :salt, type: String
  field :hashed_password, type: String
  field :uid, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: DateTime
  field :image, type: String

  validates :email, uniqueness: true

   def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email #will need to commit this line out when doing check for current email
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
     # #test to see if the email address exists 
     #  if user.email == auth.info.email
     #    #if there is an existing email
     #    #go ahead override the email uniqueness and update the user
     #    user.update_attributes(validates: false)
     #  else
     #    #else there is no email that matches
     #    #add the fb email to our user model
     #    user.email = auth.info.email
     #    #save the new user
         user.save!
     #  end

        # The following transaction covers any possible database side-effects of the
        # attributes assignment. For example, setting the IDs of a child collection.
      
    end
  end

  before_save :hash_stuff

  def authenticated? (pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
  end

  private

  def hash_stuff
    self.salt = BCrypt::Engine.generate_salt
    self.hashed_password = BCrypt::Engine.hash_secret(@password, self.salt)
    @password = nil
  end

end
