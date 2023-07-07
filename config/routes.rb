# Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb
Rails.application.routes.draw do
  post 'customers', to: 'customers#create'
  post 'login', to: 'authentication#login'
  post 'admins', to: 'admins#create'
  # post 'ad/login', to: 'admins#authenticate_user'
  post 'login', to: 'authentication#login'
  resources :services
  get '/servicewith', to: 'services#services_with_names'


  post 'reviewcreate',to: 'reviews#create'

  get '/singleservice', to: 'customers#search_service'

end

# end
