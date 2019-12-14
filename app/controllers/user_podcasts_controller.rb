class UserPodcastsController < ApplicationController

  def get_profile
    @userPodcasts = User.get_user_podcasts(params[:id])
    @user = User.find(params[:id])
    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end
  end

  def create
    podcast=Podcast.add_podcast_to_db(params[:itunes_id],params[:image_url],params[:name])
    @user_podcast = UserPodcast.create(user:current_user, podcast:podcast)
    flash[:success]= I18n.t 'podcast.subscribe'
    if (!params[:itunes_id].blank?)
      @podcast = Podcast.episode_search(params[:itunes_id])
    else
      flash[:error] = I18n.t 'podcast.error'
    end
    respond_to do |format|
      format.js { render partial: 'podcastapp/episode/find_episode' }
    end
  end


  def destroy
    @podcast=Podcast.where("itunes_id="+params[:itunes_id]).first
    @user_podcast = UserPodcast.where("user_id="+params[:user_id]+" AND podcast_id="+@podcast.id.to_s).first
    @user_podcast.destroy
    flash[:success]=I18n.t 'podcast.unsubscribe'
    ##Refresh rails podcast page
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
