Rails.application.config.middleware.use OmniAuth::Builder do
  provider :soundcloud, 'dc051eb3245282d8cb8e8b2f991804a2', 'a63f835a010c33774b379b2e716d3d9b'
end