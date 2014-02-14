class Ability
	include Mongoid::Document
  include CanCan::Ability

  def initialize(user)
  end
end