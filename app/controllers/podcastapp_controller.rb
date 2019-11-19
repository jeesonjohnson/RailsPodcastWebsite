class PodcastappController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def search
  end

  def findEpisode
    @episode=Episode.episode_search(params[:itunes_id]);

  end


end
