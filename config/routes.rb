Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/getItems', to: 'price_calculator#getItems'
  post '/totalCost', to: 'price_calculator#totalCost'
  get '/price', to: 'price_calculator#getPrice'
end
