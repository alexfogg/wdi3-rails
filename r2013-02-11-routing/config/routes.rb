R20130211Routing::Application.routes.draw do
  get '/home' => 'home#home'
  get '/A' => 'home#A'
  get '/B' => 'home#B'
  get '/1' => 'home#One'
  get '/2' => 'home#Two'
  get '/3' => 'home#Three'
  # get '/dogs/faq2' =>'dogs#faq2'

  # get '/auto/:color' => 'auto#color'
  # get '/auto/:hp/:torque' => 'auto#engine'

  # get '/calc/:x/:y/:operator' => 'calc#index'

  # get '/funny' => 'funny#lol'

  # root :to => 'Wwlcome#index'
end

