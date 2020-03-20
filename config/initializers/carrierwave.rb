require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # if Rails.env.production?
  # これしか書いていない状態でstaging環境でテストし、「ArgumentError ( is not a recognized provider):」
  if Rails.env.production? || Rails.env.staging?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'xxxxxxxxxxxxxxxx'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/xxxxxxxxxxxxxxxx'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: "s3-ap-northeast-1",
      path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/