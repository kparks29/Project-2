require 'bcrypt'

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
      user.email = auth.info.email 
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)


      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      puts user.new_record?

      @checkuser = User.find_by(email: auth[:info][:email])
      if @checkuser && @checkuser.email == auth.info.email
        user.id = @checkuser.id
        @checkuser.update!(name: user.name, first_name: user.first_name, last_name: user.last_name, uid: user.uid, provider: user.provider, image: user.image, oauth_token: user.oauth_token, oauth_expires_at: user.oauth_expires_at)
      else
        user.save!
      end


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
    if @password != nil
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(@password, self.salt)
      @password = nil
    end
  end

end
