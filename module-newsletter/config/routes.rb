Rails.application.routes.draw do
  
  LOCALES = /en|es|de|fr|it|pt/
  
  scope "(:locale)", :locale => LOCALES do
    
    root 'home#index'
    get 'home/cancel_newsletter'
    post 'home/destroy_newsletter'
    post 'home/create_newsletter', to: 'home#create_newsletter', :as => :create_newsletter  
    get 'term_newsletter/index'
    
    get 'home/index'
    get 'welcome/index'
    resources :newsletters
    
    devise_for :admins, 
            path: '', 
            path_names: { sign_in: "login", sign_out: "logout" }, 
            controllers: { sessions: "admins/sessions" }
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
