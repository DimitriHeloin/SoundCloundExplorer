Rails.application.config.middleware.use OmniAuth::Builder do
	silence_warnings do
	  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
	end
  	provider :soundcloud, '2b605e5c6b5b72f835f8491be23c956e', '063f8ec6e877a623176f8cf03ca1c094'
end

OmniAuth.config.on_failure = UsersController.action(:oauth_failure)
