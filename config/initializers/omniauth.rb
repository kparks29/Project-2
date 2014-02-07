OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '428612450605326', '813ed6b772f90133354a75345021956a'
end