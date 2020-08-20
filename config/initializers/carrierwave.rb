require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  # 変更箇所。うまく動作しない場合は、下記のif文を消す
  if Rails.env.production? # 本番環境:AWS
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
    }
    config.fog_public     = true # 直リンクでのアクセスを許可する
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'} # キャッシュ保存する日時
    config.fog_directory = 'teachers-production'
    config.asset_host = 'https://teachers-production.s3.amazonaws.com'
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end
end
