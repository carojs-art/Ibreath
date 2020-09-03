Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about-us', to: 'pages#about_us'
  get '/pairing', to: 'pages#pairing'
  get '/tutorial', to: 'pages#tutorial'
  get '/prepwork', to: 'pages#prepwork'
  get '/program-launch', to: 'pages#program_launch'
  get '/prepwork-results', to: 'pages#prepwork_results'
  get '/my-program', to: 'pages#my_program'
  get '/calendar', to: 'pages#calendar'
  get '/daily_program', to: 'pages#daily_program'
  get '/statistics', to: 'pages#statistics'
  get '/trophies', to: 'pages#trophies'
  post '/unlock', to: 'case#unlock'
  get '/add-a-cigarette', to: 'pages#add_a_cigarette'
  get '/manifest.json', to: 'service_worker#manifest'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :smokes, only: [:create, :destroy, :new]
  resources :programs, only: [:create, :show]
end
