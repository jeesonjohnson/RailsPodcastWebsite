class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.friendships.build(friend_id: @user.id)
    if current_user.save
      flash[:success] = 'Sucessfully added your friend'

    else
      flash[:danger] = 'Sucessfully unfollowed your friend'
    end
    @userPodcasts = User.get_user_podcasts(params[:user_id])

    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end
  end

  def destroy
    @friendship = current_user.friendships.where('friend_id = ' + params[:user_id].to_s).first
    if @friendship.blank?
      flash[:success] = 'Error! In unfollowing your friend'
    else
      @friendship.destroy
      flash[:success] = 'Sucessfully unfollowed your friend'
    end

    @user = User.find(params[:user_id])
    @userPodcasts = User.get_user_podcasts(params[:user_id])
    puts 'COmpelted'
    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end
  end

  def search_friends
    if (params[:friend_search_query] == '@') || (params[:friend_search_query].delete(' ') == '')
      @search = nil
    else
      @search = User.search(params[:friend_search_query])
      puts params[:friend_search_query]
  end
    respond_to do |format|
      format.js { render partial: 'podcastapp/friendsresult' }
    end
  end
end
