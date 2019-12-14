require 'date'
class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Validates all user specific fields, to prevent user errors.
  validates :first_name, length: {minimum: 2, maximum: 30}, presence:true
  validates :last_name, length: {minimum: 2, maximum: 30}, presence:true

  # User associations to podcasts
  has_many :user_podcasts
  has_many :podcasts, through: :user_podcasts
  # User associations to other given user's as friends
  has_many :friendships
  has_many :friends, through: :friendships


  # Provides fucntion to check if the current user is already subscrubed to a
  # a given podcast, a boolean response is returned.
  def podcast_already_subscribed(itunes_id, user_id)
    @podcast = Podcast.where('itunes_id = ' + itunes_id.to_s)[0]
    if @podcast.blank?
      return false
    else
      userpod = UserPodcast.where('podcast_id = ' + @podcast.id.to_s + ' AND user_id = ' + user_id.to_s)[0]
      return !userpod.blank?
    end
  end

  # Searches the entier database for podcasts that are associated to a given user
  # and provides them in such a manor that it is easy to parse in views, essentailly
  # in JSON format.
  def self.get_user_podcasts(user_id)
    userPods = UserPodcast.where('user_id = ' + user_id.to_s)
    podcasts = []
    userPods.size.times do |podIndex|
      pod=Podcast.where("id = " + userPods[podIndex]["id"].to_s).first
      # This if check is to prevent errors from occuring when multiple soam requests are made to the function
      if(!pod.blank?)
        podcasts.push(pod)
      end
    end
    return podcasts
  end

  # Returns the current users full name in correctly formated function.
  # If formating of a given user's name cannot be foramted the user name is
  # returend as being "Anonymous"
  def full_user_name
    formatedName=first_name[0].upcase+first_name[1,first_name.size].downcase+" "+last_name[0].upcase+last_name[1,last_name.size].downcase
    return formatedName.strip if (first_name || last_name)
    return "Anonymous"
  end

  # Returns how old the users account is, in relation to the account creation date
  # to the current date
  def account_creation_date
    accountAge=(Date.today()-Date.parse(created_at.to_s)).to_i
  end

  # Returns boolean for weather a given friend is already subscribed to a given user
  def user_already_friend(friend_id)
    @friend = Friendship.where('friend_id = ' + friend_id.to_s + " AND user_id = "+id.to_s)[0]
    return !@friend.blank?
  end


  # Search query allows for the searching of a new user given a search query
  # that may match the user, approprait inplace foramting is done on the serach
  # term to allow efficient searching.
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
  # Extended functionality of above self.search function.
  # In which a given term is searched for a givne field
  def self.matches(field_name, term)
    User.where("#{field_name} like ?", "%#{term}%")
  end


end
