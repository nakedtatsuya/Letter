Rails.application.routes.draw do
  root 'letters#new'
  get '/letter/:id' , to: 'letters#show'
  post 'letters/create', to: 'letters#create'
  resources :letters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
