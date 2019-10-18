Rails.application.routes.draw do
  resources :all_votes
  root to: 'public/elections#index'
  namespace :public do
    resources :elections, only: %i(index show)
  end

  resources :elections do
    resources :ballots, only: %i(new)
    resources :candidates
    resources :votes
    resources :results, only: %i(index)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
