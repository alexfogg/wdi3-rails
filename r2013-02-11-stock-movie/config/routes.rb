R20130211StockMovie::Application.routes.draw do
  get '/' => 'home#index'
  get '/faq' => 'home#faq'
  get '/about' => 'home#about'


  get '/movie' => 'movie#new'
  get '/submitmovie' => 'movie#submitmovie'
  get '/movie/poster' => 'movie#poster'


  get '/stock' => 'stock#newstock'
  get '/submitstock' => 'stock#submitstock'
  get '/stock/result' => 'stock#result'
end
