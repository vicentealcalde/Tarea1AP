Rails.application.routes.draw do
  get 'books/search', to: 'books#search', as: 'search_books'

  resources :sales
  resources :reviews
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'
end
