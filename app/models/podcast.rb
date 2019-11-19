# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'feedjira'

class Podcast < ApplicationRecord
  def self.new_podcast_search(search_term)
    puts 'HASDHJJAHDGASHGDJHASHKJASHJASHKJASHJASHKASDHDKASHDASKHDASKJDHASKJDHASKDSHKASHKASJHDKASHDASKHDASKDHASDASHKJASHDKASHDASKJHDASKJ'
    itunesURL = 'https://itunes.apple.com/search?term='
    itunesURL = itunesURL + search_term.downcase.tr(' ', '+') + '&entity=podcast'
    response = RestClient.get(itunesURL)
    response = JSON.parse(response)
    response
  end

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
    xml = RestClient.get(feed_url)
    feed = Feedjira::Feed.parse_with Feedjira::Parser::ITunesRSS, xml

  end
end
