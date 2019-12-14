require 'test_helper'

class PodcastControllerTest < ActionDispatch::IntegrationTest
  def setup
    @episode_data={:url=>"https://traffic.megaphone.fm/DGT7102510901.mp3", :title =>"Snacks Daily"}
  end

  test 'Test palying of a podcast episode' do
    # If a episode was sucesffully interperated, the appropraite response should contain the episode data, alongisde audio player url.

    get '/playaudio', params: { audioUrl: @episode_data[:url], title: @episode_data[:title] }, xhr: true
    assert_response :success
    assert body.include? @episode_data[:title]
    assert body.include? @episode_data[:url]
  end


  test 'Test searching for podcasts given a search term' do
    # Search result after request to api's and such, should return a view with a list of podcasts, which incldues the name of the podcast
    # This being as @episode_data.title is a valid existing podcast
    get '/searchpodcasts', params: { podcast: @episode_data[:title] }, xhr: true
    assert_response :success
    assert body.include? @episode_data[:title]
  end
end
