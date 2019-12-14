Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  # Home page application routes
  root 'welcome#home'
  get '/contact', to: 'welcome#contact'
  get '/about', to: 'welcome#about'
  post 'request_contact', to: 'welcome#request_contact'

  # Main podcast application routes
  get '/app', to: 'podcastapp#home'
  get '/podcast', to: 'podcastapp#find_episode'
  get '/app/search', to: 'podcastapp#search'

  # Routes that disaply given user data.
  get '/searchpodcasts', to: 'podcast#search'
  get '/playaudio', to: 'podcast#playaudio'

  # Appropriate routes associated to uesr podcast's
  resource :user_podcasts, only: [:create,:destroy]
  get '/profile/:id', to: 'user_podcasts#get_profile', as: 'user_profile'


  # Appropriate routes for friendship controller
  resource :friendships, only: [:create,:destroy]
  get '/searchfriends', to: 'friendships#search_friends'
  get '/app/findfriends', to: 'friendships#find_friends'
  get '/app/friends', to: 'friendships#friends_view'
end
