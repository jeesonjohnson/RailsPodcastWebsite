class PodcastController < ApplicationController
  def search
    # if(params[:podcast].present?)
    # @podcast = Podcast.new
    # respond_to do |format|
    #     format.js {render layout: false} # Add this line to you respond_to block
    # end
    # else

    #     flash[:error]="You have enterd an empty field"
    #     redirect_to app_search_path

    # end
    @podcast = Podcast.new_podcast_search(params[:podcast])
    # respond_to do |format|
    #         format.html { redirect_to @podcast}
    #         format.js {render layout: false} # Add this line to you respond_to block
    # end
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
