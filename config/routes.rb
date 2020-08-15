Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get "my_recipes", to: "pages#my_recipes"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :reviews, only: [:new, :create]
  end
  root "recipes#index"
end
