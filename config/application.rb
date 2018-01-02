require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Amaze
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    
    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: {
        bucket: ENV['AWS_BUCKET_NAME'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        s3_region: ENV['AWS_REGION'],
      }
    }
  end
end
