# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'feedjira'

class Episode < ApplicationRecord
  def self.episode_search(itunes_id)
    podcast_url = episode_feed_finder(itunes_id)
    result = episode_parser(podcast_url)
    result
  end


  private

  def self.episode_feed_finder(itunes_id)
    itunesURL = 'https://itunes.apple.com/lookup?id=' + itunes_id
    response = RestClient.get(itunesURL)
    response = JSON.parse(response)
    response['results'][0]['feedUrl']
  end

  def self.episode_parser(feed_url)
    # xml = Feedjira::Feed.fetch_raw feed_url
    xml = RestClient.get(feed_url)
    feed = Feedjira::Feed.parse_with Feedjira::Parser::ITunesRSS, xml

  ###################ORIGINAL
    # feed = Feedjira::Feed.fetch_and_parse feed_url
    # feed = Feedjira::Feed.parse_with Feedjira::Parser::ITunesRSS, feed

    # Want to do parsing here ask about this!!! instead of in view
  end
end
