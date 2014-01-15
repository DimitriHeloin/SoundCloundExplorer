Deviseomn::Application.routes.draw do
  devise_for :users
  get "/" => "pages#home", as: "root"
  get '/auth/:provider', to: 'pages#create_soundcloud'
  get '/auth/:provider/callback', to: 'pages#create_soundcloud'
  get 'auth/:provider/back', to: 'pages#create_client'

  get 'patient_record/expand'
  post 'nodes/set_id'
    get 'nodes/get_id'


resources :nodes do

    member do
        post 'set_id'
    end
end
resources :nodes do

    member do
        get 'get_id'
    end
end
end
