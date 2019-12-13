require 'test_helper'
class FriendshipsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user1=users(:one)
    sign_in users(:one)
    # Note user's 1 and 2 are friends already, however user 1 is not a firend of 3 as per fixture
    @user2=users(:two)
    @user3=users(:three)
  end


  test "Search for friends" do
    # Given a user search query for a user first name, the response should have a result with the user's name
    get searchfriends_url,params: { friend_search_query: @user2.first_name }, xhr: true
    assert body.include? @user2.first_name
  end

  test "Add a friend" do
    # given that @user1 is signed in, the ability sould be given for the @user1 to add @user3 as a friend
    post friendships_url,params: { user_id: @user3.id }, xhr: true
    # We test for unfriend, as otherwise the @user3 would not be friends after the request
    assert body.include? I18n.t('user.unfriend')
  end

  test "Delete a friend" do
    # given that @user1 is signed in, the ability sould be given for the @user1 to delete @user3 as a friend
    delete friendships_url,params: { user_id: @user2.id }, xhr: true
    print(body)
    assert body.include? I18n.t('user.befriend')
  end

end
