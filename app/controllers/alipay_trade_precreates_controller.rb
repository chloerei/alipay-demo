class AlipayTradePrecreatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:notify]

  def show
  end

  def create
    alipay_response = $alipay.execute(
      method: 'alipay.trade.precreate',
      biz_content: JSON.generate({
        out_trade_no: SecureRandom.uuid,
        total_amount: '0.01',
        subject: 'Test Payment 中文'
      }, ascii_only: true),
      return_url: done_alipay_trade_precreate_url,
      notify_url: notify_alipay_trade_precreate_url
    )
    logger.info alipay_response

    @qr_code_url = JSON.parse(alipay_response)['alipay_trade_precreate_response']['qr_code']
  end

  def notify
    if $alipay.verify?(request.request_parameters)
      logger.info 'Verify success'
      render plain: 'success'
    else
      logger.info 'Verify fail'
      render plain: 'fail'
    end
  end
end
