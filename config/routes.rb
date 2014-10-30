Deviseomn::Application.routes.draw do
  resources :friendships
  resources :users, except: [:sign_out,:destroy]
  devise_for :users
  get "/" => "pages#home", as: "root"
  get '/auth/:provider', to: 'pages#create_soundcloud'
  get '/auth/:provider/callback', to: 'pages#create_soundcloud'
  get '/auth/soundcloud/callback', to:'pages#create_soundcloud'
  get 'auth/:provider/back', to: 'pages#create_client'

get 'application/urltracks'
get 'application/urllikes'
get 'application/ajouteFollow'
get 'application/deleteFollow'
get 'application/search'
get 'application/changeRoot'


get '/users/show/:id', to: 'users#show'
get '/users/sign_out', to: 'devise/session#destroy' 
get '/users/:id', to: 'friendships#getFriendshipsPerUser'
get '/friendships/getFriendshipsPerUser/:id', to: 'friendships#getFriendshipsPerUser'

resources :followings,  only: [:index]

end

