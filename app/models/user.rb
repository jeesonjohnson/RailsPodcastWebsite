require 'date'
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence:true
  validates :last_name, presence:true

  ##User assosiations
  has_many :user_podcasts
  has_many :podcasts, through: :user_podcasts

  has_many :friendships
  has_many :friends, through: :friendships





  def podcast_already_subscribed(itunes_id, user_id)
    @podcast = Podcast.where('itunes_id = ' + itunes_id.to_s)[0]
    if @podcast.blank?
      return false
    else
      userpod = UserPodcast.where('podcast_id = ' + @podcast.id.to_s + ' AND user_id = ' + user_id.to_s)[0]
      return !userpod.blank?
    end
  end

  def self.get_user_podcasts(user_id)
    userPods = UserPodcast.where('user_id = ' + user_id.to_s)
    podcasts = []
    userPods.size.times do |podIndex|
      pod=Podcast.where("id = " + userPods[podIndex]["id"].to_s)[0]
      podcasts.push(pod)
    end
    return podcasts
  end


  def full_user_name
    formatedName=first_name[0].upcase+first_name[1,first_name.size].downcase+" "+last_name[0].upcase+last_name[1,last_name.size].downcase
    return formatedName.strip if (first_name || last_name)
    return "Anonymous"
  end

  def account_creation_date
    accountAge=(Date.today()-Date.parse(created_at.to_s)).to_i
  end

  def user_already_friend(friend_id)
    @friend = Friendship.where('friend_id = ' + friend_id.to_s + " AND user_id = "+id.to_s)[0]
    return !@friend.blank?
  end




end
