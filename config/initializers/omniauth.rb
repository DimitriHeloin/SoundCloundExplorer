Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :soundcloud, 'c64e305d7cb97058d42256ffc2528d93', 'e0900245108f1c143ae7524638d5d49d'
end