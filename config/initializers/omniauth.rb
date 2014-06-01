Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider :soundcloud, '21b06091d1127ab61686016e2a9d6543', '637db277478292e22d25ebabb16286fe'
end