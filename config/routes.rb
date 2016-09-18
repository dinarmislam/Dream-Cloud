Rails.application.routes.draw do
  resources :share_dreams
  resources :dictionaries
  resources :blogs do
    resources :comments
    end

    resources :comments do
      resources :comments
  end
  devise_for :users
  root 'share_dreams#index'

end
