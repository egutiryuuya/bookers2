Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  resources :users, only:[:index,:show,:edit,:update]
  resources :books do 
  resource :favorites, only:[:create,:destroy]
  end
 
  root to: 'homes#top'
  get '/home/about'=>'homes#about',as: 'about'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
