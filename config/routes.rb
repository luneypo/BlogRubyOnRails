Rails.application.routes.draw do
  root 'articles#index'

  post '/' => 'articles#create'
  get '/:id' => 'articles#show'
  patch '/:id' => 'articles#update'
  delete '/:id' => 'articles#destroy'

  post '/comment/:id' => 'articles#comment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
