Rails.application.routes.draw do
  root 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'whoami', to: 'welcome#whoami'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
