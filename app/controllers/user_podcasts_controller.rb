class UserPodcastsController < ApplicationController

  def create
    podcast=Podcast.add_podcast_to_db(params[:itunes_id],params[:image_url],params[:name])
    @user_podcast = UserPodcast.create(user:current_user, podcast:podcast)
    flash[:success]="Sucessfully subscribed to podcast"
  end


  def destroy
    @podcast=Podcast.where("itunes_id="+params[:itunes_id]).first
    @user_podcast = UserPodcast.where("user_id="+params[:user_id]+" AND podcast_id="+@podcast.id.to_s).first
    @user_podcast.destroy
    flash[:success]="Sucessfully unsubscribed to podcast"
  end
end
