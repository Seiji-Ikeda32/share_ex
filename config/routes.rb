Rails.application.routes.draw do
    root to: 'shares#index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shares
end