# frozen_string_literal: true

require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  def setup
    @podcast = Podcast.new(name: 'Snacky', author: 'Podast', rsslink: 'http://feeds.feedburner.com/podcast',
                            image_url: 'https://spongbobg.com', itunes_id:1386234383)
  end

  test 'Default database structure' do
    assert_equal 3, Podcast.count
  end

  test 'Validate ability to create podcast' do
    # Check validity when all fields are approrpaite
    @podcast.itunes_id=(@podcast.itunes_id.to_i +23).to_s
    @podcast.rsslink='http://www.ignore_field.com'
    assert @podcast.valid?
  end

  test 'Validate presence, uniqueness and minimum length of itunes_id' do
    # Check validity when all fields are approrpaite
    @podcast.save
    @podcast.rsslink = 'http:this-filed-is-not-being-tested'

    # Checking that a given podcast's itunes_id is present
    podcast1=Podcast.new(name: 'Snacky', author: 'Podast', rsslink: 'http:this-filed-is-not-being-tested', image_url: 'https://spongbobg.com')
    assert_not podcast1.valid?
    # Checking uniquness of itunes_id
    podcast2=Podcast.new(name: 'Snacky', author: 'Podast', rsslink: 'http:this-filed-is-not-being-tested', image_url: 'https://spongbobg.com', itunes_id:1386234383)
    assert_not podcast2.valid?
    # Checking minium requirments of itunes_id being greater than 2 characters
    @podcast.itunes_id = 1
    assert_not @podcast.valid?
  end


  test 'Validate presence, uniqueness and minimum length of rsslink' do
    @podcast.save
    # Checking that a given podcast's rssLink is present
    podcast1=Podcast.new(name: 'Snacky', author: 'Podast', image_url: 'https://spongbobg.com', itunes_id:1386)
    assert_not podcast1.valid?
    # Checking uniquness of an rsslink
    podcast2=Podcast.new(name: 'Snacky', author: 'Podast', rsslink: 'http://feeds.feedburner.com/podcast', image_url: 'https://spongbobg.com', itunes_id:1386234383)
    assert_not podcast2.valid?
    # Checking minium requirments of rsslink being greater than 5 characters
    podcast3=Podcast.new(name: 'Snacky', author: 'Podast', rsslink: 'htt', image_url: 'https://spongbobg.com', itunes_id:1)
    assert_not podcast3.valid?
  end

  test 'Check that podcast name is presence' do
    @podcast.name=""
    assert_not @podcast.valid?
  end

end
