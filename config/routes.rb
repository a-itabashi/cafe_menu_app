Rails.application.routes.draw do

  root to: 'homes#index'

  get '/starbucks', to: 'homes#index'
  get '/pronto', to: 'homes#index'
  get '/doutor', to: 'homes#index'
  get '/tullys', to: 'homes#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :starbucks, only: [:index]
      resources :prontos, only: [:index]
      resources :doutors, only: [:index]
      resources :tullys, only: [:index]
    end
  end
end
