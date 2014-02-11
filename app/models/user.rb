class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  attr_accessor :password

  field :first_name, type: String
  field :last_name, type: String
  field :name, type: String
  field :email, type: String
  field :city, type: String
  field :state, type: String
  field :zip_code, type: Integer
  field :date_of_birth, type: Date
  field :salt, type: String
  field :hashed_password, type: String
  field :uid, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: DateTime
  field :image, type: String

  validates :email, uniqueness: {message: "already subscribed"}

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
      user.save!
    end
  end

  before_save :hash_stuff

  def authenticated? (pwd)
    self.hashed_password == BCrypt::Engine.hash_secret(pwd, self.salt)
    @password = nil
  end

  private

  def hash_stuff
    self.salt = BCrypt::Engine.generate_salt
    self.hashed_password = BCrypt::Engine.hash_secret(self.password, self.salt)
    @password = nil
  end

end
