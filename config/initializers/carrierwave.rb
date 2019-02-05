CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS"],
      aws_secret_access_key: ENV["AWS_SECRET"],
      region: 'ap-northeast-1'
  }

  config.fog_directory  = 'letter-app'
  config.cache_storage = :fog
end
# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
