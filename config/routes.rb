Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get '/contact', to: 'welcome#contact'
  post 'request_contact', to: 'welcome#request_contact'


  get '/app', to: 'podcastapp#home'

  get '/app/search', to: 'podcastapp#search'

  get '/searchpodcasts', to: 'podcast#search'

  get '/podcast', to: 'podcastapp#find_episode'

  get '/playaudio', to: 'podcast#playaudio'

  delete '/user_podcasts', to: 'user_podcasts#destroy'
  post '/user_podcasts', to: 'user_podcasts#create'

  get '/profile/:id', to: 'user_podcasts#get_profile', as: 'user_profile'


  # Appropriate routes for friendship controller
  resource :friendships, only: [:create,:destroy]
  get '/searchfriends', to: 'friendships#search_friends'
  get '/app/findfriends', to: 'friendships#find_friends'
  get '/app/friends', to: 'friendships#friends_view'
end
