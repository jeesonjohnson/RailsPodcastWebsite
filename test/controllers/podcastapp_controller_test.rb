require 'test_helper'

class PodcastappControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:one)
    sign_in users(:one)
    @podcast=podcasts(:one)
  end

  test 'Display the appropraite home page to the user' do
    # Depending on weather differnt types of request are made, the user is presented with a differnt view.
    get app_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', I18n.t('app_title')
    assert_select 'h1', I18n.t('app_title')
    assert body.include? I18n.t('home.title')
  end

  test 'Display the appropraite home page to the user, as per AJAX request' do
    # This response is provided if the request the user makes of a remote, AJAX test
    get app_url, xhr: true
    assert_response :success
    assert body.include? I18n.t('home.title')
  end


  test 'Display the appropraite search page to the user' do
    # This response is provided if the request the user makes of a remote, AJAX test
    get app_search_url, xhr: true
    assert_response :success
    assert body.include? I18n.t('search.title')
  end

  test 'Display the appropraite podcast to a user, given an appropriate itunes_id request' do
    # This response is provided if the request the user makes of a remote, AJAX test
    get podcast_url,params: { itunes_id: @podcast.itunes_id}, xhr: true
    assert_response :success
    assert body.include? @podcast.name
  end


end
