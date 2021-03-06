require 'csv'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  
  config.x.pem = File.read('config/keys/development/public.pem')
  config.x.symkey = File.read("config/keys/development/symkey.txt")
  
  #config.x.auth_users contains users {{'Saarbruecken', 'pw1'},{'Bochum', 'pw2'}, {'Ulm', 'pw3'}}
  csv_text_http_auth_users = File.read('config/keys/development/http_auth_users.csv')
  config.x.auth_users = CSV.parse(csv_text_http_auth_users, :headers => false).to_h
  
  csv_text_http_auth_admin = File.read('config/keys/development/http_auth_admin.csv')
  config.x.auth_admin = CSV.parse(csv_text_http_auth_admin, :headers => false).to_h
 
  csv_text_config_data = File.read('config/keys/development/config_data.csv')
  config_data_hash = CSV.parse(csv_text_config_data, :headers => false).to_h
  config.x.website_title = config_data_hash["Website Title"]
  config.x.festival_start = DateTime.parse(config_data_hash["Festival Start"])
  config.x.festival_end = DateTime.parse(config_data_hash["Festival End"])
  config.x.deadline = DateTime.parse(config_data_hash["Deadline"])
  config.x.admin_email = config_data_hash["Admin Email"]
  config.x.send_mails_from = "festival@mail.de"

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false
  
  # added for letter opener https://github.com/ryanb/letter_opener
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = true
  
  #enabling urls in mailers
  config.action_mailer.default_url_options = { host: "localhost:3000" }

#   config.action_mailer.smtp_settings = {
#     address:              'smtp.gmail.com',
#     port:                 587,
#     domain:               'gmail.com',
#     user_name:            ENV["EMAIL_USER_NAME"],
#     password:             ENV["EMAIL_PASSWORD"],
#     authentication:       :plain,
#     enable_starttls_auto: true
#   }
#   
#   
  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true
  
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
