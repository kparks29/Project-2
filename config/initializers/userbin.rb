Userbin.configure do |config|
  config.app_id = "524922843494921"
  config.api_secret = "Xz3LLygrgc2w7ezZ4Pkk4pkTcGkz8gRT"

  config.find_user = -> (userbin_id) do
	  User.find_by_userbin_id(userbin_id)
	end

	# will be called when a user signs up
	config.create_user = -> (profile) do
	  User.create! do |user|
	    user.userbin_id = profile.id
	    user.email      = profile.email
	    user.photo      = profile.image
	  end
	end

	#config.skip_script_injection = true

end