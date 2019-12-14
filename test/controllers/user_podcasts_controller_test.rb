require 'test_helper'

class UserPodcastsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:one)
    sign_in users(:one)
    # User 2 should have an associated podcast two
    @user2 = users(:two)
    @user2podcast = podcasts(:two)
  end

  test 'Present user profile showing appropriate user profiles' do
    get '/profile/'+@user2.id.to_s, params: { id: @user2.id }, xhr: true
    assert body.include? 'JRE'
  end

  test 'Destory existing podcast from database' do
    delete user_podcasts, params: { itunes_id: @user2podcast.itunes_id}, xhr: true
    assert_equal 2, Podcast.count
  end

  test 'Add a new podcast to database, and present appropriate views' do
    # podcast={:itunes_id=>"1272970334", :image_url=>"https://content.production.cdn.art19.com/images/f5/cf/d8/37/f5cfd837-6c97-4422-a573-4ea06f2b2a13/92560badd97d72391e87a7f98ef308a82f3f8973b0ac04d558be398f1bb06c4d0b09e982e9f7d939e7a7be6f06470d4b2f015e2211d4c4a67c73378122690d54.jpeg", :name=>"Dirty John"}
    # assert_equal 3, Podcast.count
    # post user_podcasts, params: { itunes_id: podcast[:itunes_id],image_url: podcast[:image_url],name: podcast[:name] }, xhr: true
    post user_podcasts, params: { itunes_id: @user2podcast.itunes_id,image_url: @user2podcast.image_url,name: @user2podcast.name }, xhr: true
    print(body)
    # assert_equal 4, Podcast.count

    assert body.include? 'JRE'
  end



end
