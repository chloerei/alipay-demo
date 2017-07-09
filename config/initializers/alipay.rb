$alipay = Alipay::Client.new(
  url: ENV.get('ALIPAY_URL'),
  app_id: ENV.get('ALIPAY_APP_ID'),
  app_private_key: ENV.get('ALIPAY_APP_PRIVATE_KEY'),
  alipay_public_key: ENV.get('ALIPAY_PUBLIC_KEY'),
)
