class PodcastController < ApplicationController
  def search
    @podcast = Podcast.new_podcast_search(params[:podcast])
    respond_to do |format|
      format.js { render partial: 'podcastapp/result' }
    end
  end


  def playaudio
    respond_to do |format|
      format.js { render partial: 'podcastapp/audioplayer' }
    end

  end



end
