class PodcastappController < ApplicationController
  before_action :authenticate_user!

  def home
    @userPodcasts = User.get_user_podcasts(current_user.id)
    @topPodcasts = Podcast.get_top_podcasts
  end

  def search
  end

  def findEpisode
    if !params[:itunes_id].blank?
      @podcast = Podcast.episode_search(params[:itunes_id])
    else
      flash[:error] = 'Invalid podcast page'
    end
  end

  def find_friends

  end

  def friends
    @friendships=current_user.friends
  end



end
