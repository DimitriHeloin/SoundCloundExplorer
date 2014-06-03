Deviseomn::Application.routes.draw do
  devise_for :users
  get "/" => "pages#home", as: "root"
  get '/auth/:provider', to: 'pages#create_soundcloud'
  get '/auth/:provider/callback', to: 'pages#create_soundcloud'
  get 'auth/:provider/back', to: 'pages#create_client'

get 'application/urltracks'
get 'application/urllikes'
get 'application/ajouteFollow'
get 'application/deleteFollow'
get 'application/search'
get 'application/changeRoot'

resources :followings,  only: [:index]

end

