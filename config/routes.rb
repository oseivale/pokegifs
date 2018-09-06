Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pokemon, only: %i(index show)

  root 'pokemon#index'

  get 'pokemon' => 'pokemon#index'
end
