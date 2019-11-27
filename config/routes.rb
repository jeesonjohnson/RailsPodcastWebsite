Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/app', to: 'podcastapp#home'

  get '/app/search', to: 'podcastapp#search'

  get '/searchpodcasts', to: 'podcast#search'

  get '/podcast', to: 'podcastapp#findEpisode'

  get '/playaudio', to: 'podcast#playaudio'

  resources :user_podcasts, only: [:create]
end
