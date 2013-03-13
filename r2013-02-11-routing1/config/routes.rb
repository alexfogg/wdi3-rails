R20130211Routing1::Application.routes.draw do
  get '/start' => 'start#start'
  get '/A' => 'start#A'
  get '/B' => 'start#B'
  get '/1' => 'start#One'
  get '/2' => 'start#Two'
  get '/3' => 'start#Three'
  get '/door' => 'start#door'
  # get '/dogs/faq2' =>'dogs#faq2'

  # get '/auto/:color' => 'auto#color'
  # get '/auto/:hp/:torque' => 'auto#engine'

  # get '/calc/:x/:y/:operator' => 'calc#index'

  # get '/funny' => 'funny#lol'

  # root :to => 'Wwlcome#index'
end
