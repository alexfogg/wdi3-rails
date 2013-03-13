R20130307Letsgitphysical::Application.routes.draw do
  root :to => 'home#index'
  resources :exercises, :only => [:index, :new, :create] do
  collection do
    get ':activity', :action => 'chart'
  end
end
  resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end