Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects
  resources :volunteers
  post '/signup', to: 'users#create'
  post '/login', to: 'users#find'
  get '/profile', to: 'users#profile'
  get "/get_user", to: "users#get_user"
end
