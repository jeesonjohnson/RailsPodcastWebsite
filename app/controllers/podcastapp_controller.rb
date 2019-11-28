class PodcastappController < ApplicationController
  before_action :authenticate_user!

  def home
    @userPodcasts=User.get_user_podcasts(current_user.id)
    # render json: @userPodcasts
  end

  def search
  end

  def findEpisode
    if(!params[:itunes_id].blank?)
    @podcast=Podcast.episode_search(params[:itunes_id])
  else
    flash[:error]="Invalid podcast page"
  end

  end


end
