Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'buddies', to: 'buddies#index'
      post 'buddies/create'
      delete 'buddies/:id', to: 'buddies#destroy'
    end
  end

  root 'react#index'

  resources :buddies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
