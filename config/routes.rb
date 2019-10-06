Rails.application.routes.draw do
  root to: 'public/elections#index'
  namespace :public do
    resources :elections, only: %i(index show)
  end

  resources :elections do
    resources :candidates
    resources :votes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
