R20130228Todo::Application.routes.draw do
root :to => 'home#index'
resources :users, :tasks, :home, :session

get '/login' => 'session#new'
post '/login' => 'session#create'
delete '/login' => 'session#destroy'

resources :priorities, :only => [:index, :create, :update] do
    member do
      post :up
      post :down
    end
  end
end
