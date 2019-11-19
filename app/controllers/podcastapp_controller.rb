class PodcastappController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def search
  end

  def findEpisode
    @podcast=Podcast.episode_search(params[:itunes_id]);

  end


end
