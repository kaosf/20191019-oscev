Rails.application.routes.draw do
  root to: 'public/elections#index'
  namespace :public do
    resources :elections, only: %i(index show)
  end

  resources :elections do
    resource :all_votes, only: %i(destroy)
    resources :ballots, only: %i(new)
    resources :candidates
    resources :votes
    resources :results, only: %i(index)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
