class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.friendships.build(friend_id: @user.id)
    if current_user.save
      flash[:success] = I18n.t 'friendship.add_friend_suc'

    else
      flash[:danger] =I18n.t 'friendship.add_friend_fail'
    end
    @userPodcasts = User.get_user_podcasts(params[:user_id])
    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end

  end

  def destroy
    @friendship = current_user.friendships.where('friend_id = ' + params[:user_id].to_s).first
    if @friendship.blank?
      flash[:success] = I18n.t 'friendship.error_unfollow'
    else
      @friendship.destroy
      flash[:success] = I18n.t 'friendship.add_friend_fail'
    end

    @user = User.find(params[:user_id])
    @userPodcasts = User.get_user_podcasts(params[:user_id])
    respond_to do |format|
      format.js { render partial: 'user_podcasts/user' }
    end
  end

  def search_friends
    if (params[:friend_search_query] == '@') || (params[:friend_search_query].delete(' ') == '')
      @search = nil
    else
      @search = User.search(params[:friend_search_query])
  end
    respond_to do |format|
      format.js { render partial: 'podcastapp/friends/friendsresult' }
    end
  end


  # Below method is responsible for displaying a view to the user that allows the user to search for friends.
  # Which is rendered as a partial using AJAX.
  def find_friends
    respond_to do |format|
      format.js { render partial: 'podcastapp/friends/find_friends' }
    end
  end


  # Below method finds all associated friends for the current logged in user, and displys them in an appropraite way.
  # Result of friends request for current user is returned to the user as a variable @friendships
  def friends_view
    @friendships=current_user.friends
    respond_to do |format|
      format.js { render partial: 'podcastapp/friends/friends' }
    end
  end


end
