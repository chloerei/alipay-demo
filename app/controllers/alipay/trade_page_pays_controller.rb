class Alipay::TradePagePaysController < ApplicationController
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
  end

  def notify
  end
end
