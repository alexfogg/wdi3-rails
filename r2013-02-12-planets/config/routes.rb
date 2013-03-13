R20130212Planets::Application.routes.draw do
  get '/planets' => 'planets#index'
  post '/planets' => 'planets#create'
  get '/planets/new' => 'planets#new'
  get '/planets/:id' => 'planets#show', :as => 'planet'
  post '/planets/:id/destroy' => 'planets#destroy', :as => 'planet_delete'
  get '/planets/:id/edit' => 'planets#edit', :as => 'planet_edit'
  root :to => 'planets#index'
end
