
Devise.setup do |config|

  config.jwt do |jwt|
		jwt.secret = Rails.application.credentials.devise[:jwt_secret_key]
	end
 
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'


  require 'devise/orm/active_record'


  config.case_insensitive_keys = [:email]


  config.stretches = Rails.env.test? ? 1 : 12

  
  config.reconfirmable = true

  
  config.expire_all_remember_me_on_sign_out = true

  
  config.password_length = 6..128

  # Email regex used to validate email formats. It simply asserts that
  # one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  
  config.reset_password_within = 6.hours

  
  config.sign_out_via = :delete

  
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other


end
