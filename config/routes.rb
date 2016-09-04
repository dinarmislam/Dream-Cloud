Rails.application.routes.draw do
  devise_for :users
  resources :blogs do

  end
  resources :comments
  root 'blogs#index'
end
