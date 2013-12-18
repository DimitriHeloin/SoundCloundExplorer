Deviseomn::Application.routes.draw do
  devise_for :users
  get "/" => "pages#home", as: "root"

  get '/auth/:provider/callback', to: 'pages#create_soundcloud'
end
