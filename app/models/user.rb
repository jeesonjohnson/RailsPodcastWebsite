require 'date'
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, length: {minimum: 2, maximum: 30}, presence:true
  validates :last_name, length: {minimum: 2, maximum: 30}, presence:true

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
      pod=Podcast.where("id = " + userPods[podIndex]["id"].to_s).first
      if(!pod.blank?)##This if check is to prevent errors from occuring when multiple soam requests are made to the function
        podcasts.push(pod)
      end
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

=begin
Search query allows for the searching of a new user given a search query that may match the user.
approprait inplace foramting is done on the serach term to allow efficient searching.
=end
  def self.search(term)
    term.strip!
    term.downcase!
    first_name_res=matches("first_name",term)
    last_name_res=matches("last_name",term)
    email_res=matches("email",term)
    result=(first_name_res+last_name_res+email_res).uniq
    return nil unless result
    result
  end
##Extended functionality of above self.search function. In which a given term is searched for a givne field
def self.matches(field_name, term)
  User.where("#{field_name} like ?", "%#{term}%")
end


end
