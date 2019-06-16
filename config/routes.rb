Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'doutors/index'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'uniqlos/index'
    end
  end
  root to: 'homes#index'

  get '/starbucks', to: 'homes#index'
  get '/pronto', to: 'homes#index'
  get '/doutor', to: 'homes#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :starbucks, only: [:index]
      resources :prontos, only: [:index]
      resources :doutors, only: [:index]
    end
  end
end
