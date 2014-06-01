Deviseomn::Application.routes.draw do
  devise_for :users
  get "/" => "pages#home", as: "root"
  get '/auth/:provider', to: 'pages#create_soundcloud'
  get '/auth/:provider/callback', to: 'pages#create_soundcloud'
  get 'auth/:provider/back', to: 'pages#create_client'

get 'application/urltracks'
get 'application/urllikes'


resources :followings,  only: [:index]

end

