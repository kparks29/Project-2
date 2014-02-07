class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
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

   def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.city = auth
      user.image = auth.info.image
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
