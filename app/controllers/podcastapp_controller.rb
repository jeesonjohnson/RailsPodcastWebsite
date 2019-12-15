class PodcastappController < ApplicationController
  # It is vital that the user is authenticated before the user can use the
  # main application, since it is vital for most of the application's abilties
  before_action :authenticate_user!

  # The podcast application is preseneted to the user as either a remote AJAX
  # response or as a view, where in which the view is presented the users top
  # podcasts, and the current top podcasts.
  def home
    @userPodcasts=current_user.podcasts
    @topPodcasts = Podcast.get_top_podcasts
    # Checks if the user request is an AJAX request, if so renders approrpaitly
    if request.xhr?
      respond_to do |format|
        format.js { render partial: 'podcastapp/home/home' }
      end
    end
  end

  # Provides the user with the approrpaite view that allows the user to search
  # for podcasts, given a search query, provided in params action
  def search
    respond_to do |format|
      format.js { render partial: 'podcastapp/search/search' }
    end
  end

  # Provides the user the ability to view a given podcast, given thier unique
  # itunes_id, which if the given itunes_id is not a valid itune id the user is
  # presented with  flash error.
  def find_episode
    if !params[:itunes_id].blank?
      @podcast = Podcast.episode_search(params[:itunes_id])
    else
      flash[:error] = I18n.t 'podcast.error'
    end
    # Renders appropriate view.
    respond_to do |format|
      format.js { render partial: 'podcastapp/episode/find_episode' }
    end
  end



end
