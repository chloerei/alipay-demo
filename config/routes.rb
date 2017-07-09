Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :alipay do
    resource :trade_page_pay do
      get :done
      post :notify
    end
  end
end
