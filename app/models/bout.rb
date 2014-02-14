class Bout
  include Mongoid::Document

  belongs_to :user

  field :name, type: String
  field :date, type: DateTime
  field :description, type: String
  field :tags, type: String
  field :status?, type: String
  field :speaker1, type: String
  field :speaker2, type: String
  field :moderator, type: String
  
end
