class PodcastappController < ApplicationController
  before_action :authenticate_user!

  def home
    @userPodcasts = User.get_user_podcasts(current_user.id)
    @topPodcasts = Podcast.get_top_podcasts
    if request.xhr?
      respond_to do |format|
        format.js { render partial: 'podcastapp/home/home' }
      end
    end
  end

  def search
    respond_to do |format|
      format.js { render partial: 'podcastapp/search/search' }
    end
  end

  def find_episode
    if (!params[:itunes_id].blank?)
      @podcast = Podcast.episode_search(params[:itunes_id])
    else
      flash[:error] = I18n.t 'podcast.error'
    end
    respond_to do |format|
      format.js { render partial: 'podcastapp/episode/find_episode' }
    end
  end



end
