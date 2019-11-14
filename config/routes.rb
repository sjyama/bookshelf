Rails.application.routes.draw do
  resources :shelves
    root to: 'books#index'
    get 'search', to: 'books#search'
    resources :books
end
