Rails.application.routes.draw do
  resource :alipay_trade_page_pay do
    get :done
    post :notify
  end

  resource :alipay_trade_precreate do
    get :done
    post :notify
  end
end
