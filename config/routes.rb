Rails.application.routes.draw do
  devise_for :users
  
  post '/top/guest_sign_in', to: 'top#new_guest'
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'top#index'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shares
  resources :users
end
