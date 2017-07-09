class Alipay::TradePagePaysController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:notify]

  def show
  end

  def create
    redirect_to $alipay.page_execute_url(
      method: 'alipay.trade.page.pay',
      biz_content: {
        out_trade_no: Time.now.to_s(:number),
        product_code: 'FAST_INSTANT_TRADE_PAY',
        total_amount: '0.01',
        subject: 'Test Payment'
      }.to_json,
      return_url: done_alipay_trade_page_pay_url,
      notify_url: notify_alipay_trade_page_pay_url
    )
  end

  def done
    @verify = @alipay.verify?(request.query_parameters)
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
