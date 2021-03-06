CarrierWave.configure do |config|
  if Rails.env.production?                  
    config.fog_credentials = {
      provider:              'AWS',                        
      aws_access_key_id:     ENV['aws_access_key_id'],      # 你的 key           
      aws_secret_access_key: ENV['aws_access_key_secret'],      # 你的 secret key         
      region:                'us-east-1', # 你的 S3 bucket 的 Region 位置   

    }
    config.storage = :fog     
    config.fog_directory  = 'cookforyourself' # 你設定的 bucket name 

  else
    config.storage = :file
  end
end