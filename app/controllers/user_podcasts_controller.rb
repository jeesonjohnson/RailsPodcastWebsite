class UserPodcastsController < ApplicationController
  # Allows user to view a given user profile, given the user's unique id.
  # The response provides to the view, all associated podcasts that the user has
  # along with the actual user details.
  def get_profile
    @userPodcasts = User.get_user_podcasts(params[:id])
    @user = User.find(params[:id])
    # Renders appropriate partial to user
    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end
  end

  # Provides the user to add another podcast to thier account, provided that
  # they are on the correct podcastpage. On completion of adding a podcast,
  # the podcast page is refreshed and prsented to the user, to reflect the given
  # podcast association to a given user.
  def create
    # If the given podcast is not found in database, the new podcast is added.
    podcast=Podcast.add_podcast_to_db(params[:itunes_id],params[:image_url],params[:name])
    @user_podcast = UserPodcast.create(user:current_user, podcast:podcast)
    flash[:success]= I18n.t 'podcast.subscribe'
    # Error is presemted if the podcast is not a valid podcast, or does not exit
    if (!params[:itunes_id].blank?)
      @podcast = Podcast.episode_search(params[:itunes_id])
    else
      flash[:error] = I18n.t 'podcast.error'
    end
    respond_to do |format|
      format.js { render partial: 'podcastapp/episode/find_episode' }
    end
  end

  # Prvides the user the ability to delete a given podcast that is associated to
  # thier account, provided it is indeed associated to thier account/
  def destroy
    # First the podcast is identified, the appropraite user association is found
    # then delete.
    @podcast=Podcast.where("itunes_id="+params[:itunes_id]).first
    @user_podcast = UserPodcast.where("user_id="+params[:user_id]+" AND podcast_id="+@podcast.id.to_s).first
    @user_podcast.destroy

    flash[:success]=I18n.t 'podcast.unsubscribe'
    # Refresh rails podcast page if  the podcast has been sucessfull deleted
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
