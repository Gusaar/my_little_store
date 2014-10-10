Rails.application.routes.draw do
  root to: 'home#index'

  resources :items, except: [ :new, :edit ], defaults: {format: :json}
end
