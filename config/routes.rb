Rails.application.routes.draw do
  root to: 'homes#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :starbucks, only: [:index]
    end
  end
end
