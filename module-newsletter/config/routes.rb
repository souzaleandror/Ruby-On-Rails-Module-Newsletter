Rails.application.routes.draw do
  resources :newsletters
  get 'home/index'
  get 'welcome/index'
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end