Rails.application.routes.draw do

  get '/' => 'central#index', as: :root

  # resources :users do
  #   resources :projects do
  #     resources :tasks
  #   end
  # end

  resources :users do 
    resources :projects
  end

  resources :projects do
    resources :tasks
  end

  resources :tasks

  

  ## here be the guards
  get '/log-in' => "sessions#new"
  post '/log-in' => "sessions#create", as: :log_me_in
  get '/log-out' => "sessions#destroy", as: :log_me_out
end
