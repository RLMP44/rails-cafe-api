Rails.application.routes.draw do
  # typically expecting html, override to expect json
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cafes, only: [:index, :create]
      resources :criteria, only: [:index]
    end
  end
end
