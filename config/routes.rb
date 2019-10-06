Rails.application.routes.draw do
  namespace :public do
    get 'elections/index'
    get 'elections/show'
  end
  resources :elections do
    resources :candidates
    resources :votes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
