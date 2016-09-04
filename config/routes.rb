Rails.application.routes.draw do
  resources :blogs do
    resources :comments
    end

    resources :comments do
      resources :comments
  end
  devise_for :users
  root 'blogs#index'

end
