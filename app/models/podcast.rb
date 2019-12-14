# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'feedjira'

class Podcast < ApplicationRecord
  # A given podcat is connect to user podcasts, which link a given user to a
  # given podcast.
  has_many :user_podcast
  has_many :users, through: :user_podcasts
  # Validations are performed for podcast fields, to prevent errors, and ensure
  # security of user data and podcast.
  validates :itunes_id, presence:true,length: {minimum: 2}, uniqueness: true
  validates :name, presence:true
  validates :rsslink, presence:true,length: {minimum: 5}, uniqueness: true


  # Provides ability for a given user to search for a podcat, given a podcast
  # search query, which is preseneted to the user, using Itunes API requests.
  def self.new_podcast_search(search_term)
    itunesURL = 'https://itunes.apple.com/search?term='
    itunesURL = itunesURL + search_term.downcase.tr(' ', '+') + '&entity=podcast'
    response = RestClient.get(itunesURL)
    response = JSON.parse(response)
    response
  end

  # Allows the user to identify a specific podcast, given its unique itunes_id
  # and present to the user the appropriate podcast information.
  def self.episode_search(itunes_id)
    podcast_url = episode_feed_finder(itunes_id)
    result = episode_parser(podcast_url)
    result
  end

  # If a podcast does not exist in the database, provided approrpatie podcast
  # fields are present, the podcast is added to the database.
  def self.add_podcast_to_db(itunes_id, image_url, podcast_name)
    @podcast = Podcast.where('itunes_id = ' + itunes_id)[0]
    # ONLY if podcast does not currently exist in database is is it created.
    if @podcast.blank?
      @podcast = Podcast.create(name: podcast_name, author: podcast_name, rsslink: episode_feed_finder(itunes_id), itunes_id: itunes_id, image_url: image_url)
      @podcast.save
      return @podcast
    else
      return @podcast
    end
  end


  # Returns to the user the official top 100 podcasts, as per itunes, in JSON format.
  def self.get_top_podcasts()
    response = RestClient.get("https://rss.itunes.apple.com/api/v1/us/podcasts/top-podcasts/all/100/explicit.json")
    response = JSON.parse(response)["feed"]["results"]
    return response
  end

  private
  # Allows the identification of a podcast, given the podcast's unique itunes_id
  def self.episode_feed_finder(itunes_id)
    itunesURL = 'https://itunes.apple.com/lookup?id=' + itunes_id
    response = RestClient.get(itunesURL)
    response = JSON.parse(response)
    response['results'][0]['feedUrl']
  end

  # Function allows the easy parsing of JSON data regardig a given podcast, such
  # such that it is easy to use in approrpatie views. 
  def self.episode_parser(feed_url)
    xml = RestClient.get(feed_url)
    feed = Feedjira::Feed.parse_with Feedjira::Parser::ITunesRSS, xml
  end
end
