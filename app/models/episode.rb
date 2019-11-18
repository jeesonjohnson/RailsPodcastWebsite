require 'rest-client'
require 'json'
require 'feedjira'

class Episode < ApplicationRecord
  def self.episode_search(itunes_id)
    podcast_url=self.episode_feed_finder(itunes_id)
    result = self.episode_parser(podcast_url)
    return result
  end

  private
  def self.episode_feed_finder(itunes_id)
    itunesURL = 'https://itunes.apple.com/lookup?id='+itunes_id
    response = RestClient.get(itunesURL)
    response = JSON.parse(response)
    response['results'][0]['feedUrl']
  end

  def self.episode_parser(feed_url)
    feed = Feedjira::Feed.fetch_and_parse feed_url
    # Want to do parsing here ask about this!!! instead of in view
  end

end
