Rails.application.routes.draw do
  resources :comments

  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'whoami', to: 'welcome#whoami'

  resources :articles

  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  resources :users, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :categories, except: [:destroy]
end
