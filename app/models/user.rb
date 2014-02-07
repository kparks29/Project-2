class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String
  field :user_id, type: Integer

  

end
