class UserPodcastsController < ApplicationController

  def create
    podcast=Podcast.add_podcast_to_db(params[:itunes_id],params[:image_url],params[:name])
    @user_podcast = UserPodcast.create(user:current_user, podcast:podcast)
    puts "SUCESSFULLY SAVED TO DB"
    flash[:success]="Sucessfully subscribed to podcast"
  end
end
