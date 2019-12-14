class PodcastController < ApplicationController
  # Given a podcast search term, the user is prsented with a list of podcasts,
  # That match the corrosponding search query
  def search
    @podcast = Podcast.new_podcast_search(params[:podcast_search])
    # The user is prsented with approrpaite partial for search term.
    respond_to do |format|
      format.js { render partial: 'podcastapp/search/result' }
    end
  end
  # Given user parameters, (from views, such as aduio url, and podcast name,
  # provided by the search function), an appropraite partial is presented to
  # the user, that allows the user to play the audio as according to the fields.
  def playaudio
    respond_to do |format|
      format.js { render partial: 'podcastapp/audioplayer/audioplayer' }
    end

  end

end
