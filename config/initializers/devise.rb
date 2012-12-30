# -*- encoding : utf-8 -*-
Devise.setup do |config|
    config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :facebook, '188628294595434', 'b884446d49b175b1b08fa85d61fbe348'
  config.omniauth :vkontakte, '3151174', '7YvXSWPoFtQv2bYDXp1b'
  config.omniauth :twitter, 'Om6FB01dSABKeieYjlEnQ', 'ckksm5pnXHPP7YAsELJOcHffhydgh4j8oH8wB5ecvwk'
  config.omniauth :google, '341813123009.apps.googleusercontent.com', 'pa3hTAz9zsMC2XzSD75nMNws'
end
