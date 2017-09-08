Rails.application.routes.draw do
  
  resources :topics do
    resources :sponsored_posts, except: [:index]
    resources :posts, except: [:index]
  end
  
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  
  resources :advertisements
  resources :questions
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end
