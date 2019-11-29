class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_podcasts
  has_many :podcasts, through: :user_podcasts
  validates :first_name, presence:true
  validates :last_name, presence:true

  def podcast_already_subscribed(itunes_id, user_id)
    @podcast = Podcast.where('itunes_id = ' + itunes_id)[0]
    if @podcast.blank?
      return false
    else
      userpod = UserPodcast.where('podcast_id = ' + @podcast.id.to_s + ' AND user_id = ' + user_id.to_s)[0]
      if userpod.blank?
        return false
      else
        return true
      end
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
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    return "Anonymous"
  end
end
